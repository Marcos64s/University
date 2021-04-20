%%Projeto

function [eout,thresh,gv_45,gh_135] = edge(varargin)

if strcmp(method,'canny')
    % Magic numbers
    PercentOfPixelsNotEdges = .7; % Used for selecting thresholds
    ThresholdRatio = .4;          % Low thresh is this fraction of the high.
    
    % Calculate gradients using a derivative of Gaussian filter
    [dx, dy] = smoothGradient(a, sigma);
    
    % Calculate Magnitude of Gradient
    magGrad = hypot(dx, dy);
    
    % Normalize for threshold selection
    magmax = max(magGrad(:));
    if magmax > 0
        magGrad = magGrad / magmax;
    end
    
    % Determine Hysteresis Thresholds
    [lowThresh, highThresh] = selectThresholds(thresh, magGrad, PercentOfPixelsNotEdges, ThresholdRatio, mfilename);
    
    % Perform Non-Maximum Suppression Thining and Hysteresis Thresholding of Edge
    % Strength
    e = thinAndThreshold(dx, dy, magGrad, lowThresh, highThresh);
    thresh = [lowThresh highThresh];

elseif strcmp(method,'approxcanny')
    e = computeapproxcanny(a, thresh);

elseif strcmp(method,'canny_old')
    % Magic numbers
    GaussianDieOff = .0001;
    PercentOfPixelsNotEdges = .7; % Used for selecting thresholds
    ThresholdRatio = .4;          % Low thresh is this fraction of the high.
    
    % Design the filters - a gaussian and its derivative
    
    pw = 1:30; % possible widths
    ssq = sigma^2;
    width = find(exp(-(pw.*pw)/(2*ssq))>GaussianDieOff,1,'last');
    if isempty(width)
        width = 1;  % the user entered a really small sigma
    end
    
    t = (-width:width);
    gau = exp(-(t.*t)/(2*ssq))/(2*pi*ssq);     % the gaussian 1D filter
    
    % Find the directional derivative of 2D Gaussian (along X-axis)
    % Since the result is symmetric along X, we can get the derivative along
    % Y-axis simply by transposing the result for X direction.
    [x,y]=meshgrid(-width:width,-width:width);
    dgau2D=-x.*exp(-(x.*x+y.*y)/(2*ssq))/(pi*ssq);
    
    % Convolve the filters with the image in each direction
    % The canny edge detector first requires convolution with
    % 2D Gaussian, and then with the derivative of a Gaussian.
    % Since Gaussian filter is separable, for smoothing, we can use
    % two 1D convolutions in order to achieve the effect of convolving
    % with 2D Gaussian.  We convolve along rows and then columns.
    
    %smooth the image out
    aSmooth=imfilter(a,gau,'conv','replicate');   % run the filter across rows
    aSmooth=imfilter(aSmooth,gau','conv','replicate'); % and then across columns
    
    %apply directional derivatives
    ax = imfilter(aSmooth, dgau2D, 'conv','replicate');
    ay = imfilter(aSmooth, dgau2D', 'conv','replicate');
    
    mag = sqrt((ax.*ax) + (ay.*ay));
    magmax = max(mag(:));
    if magmax>0
        mag = mag / magmax;   % normalize
    end
    
    % Select the thresholds
    if isempty(thresh)
        counts=imhist(mag, 64);
        highThresh = find(cumsum(counts) > PercentOfPixelsNotEdges*m*n,...
            1,'first') / 64;
        lowThresh = ThresholdRatio*highThresh;
        thresh = [lowThresh highThresh];
    elseif length(thresh)==1
        highThresh = thresh;
        if thresh>=1
            error(message('images:edge:singleThresholdOutOfRange'))
        end
        lowThresh = ThresholdRatio*thresh;
        thresh = [lowThresh highThresh];
    elseif length(thresh)==2
        lowThresh = thresh(1);
        highThresh = thresh(2);
        if (lowThresh >= highThresh) || (highThresh >= 1)
            error(message('images:edge:thresholdOutOfRange'))
        end
    end
    
    % The next step is to do the non-maximum suppression. We will accrue
    % indices which specify ON pixels in strong edgemap The array e will become
    % the weak edge map.
    e = cannyFindLocalMaxima(ax,ay,mag,lowThresh);
    
    if ~isempty(e)
        [rstrong,cstrong] = find(mag>highThresh & e);
        
        if ~isempty(rstrong) % result is all zeros if idxStrong is empty
            e = bwselect(e, cstrong, rstrong, 8);
            e = bwmorph(e, 'thin', 1); % Thin double (or triple) pixel wide contours
        end
    end
    
elseif any(strcmp(method, {'log','zerocross'}))
    % The output edge map:
    e = false(m,n);
    
    rr = 2:m-1; cc=2:n-1;
    
    % We don't use image blocks here
    if isempty(H)
        fsize = ceil(sigma*3) * 2 + 1;  % choose an odd fsize > 6*sigma;
        op = fspecial('log',fsize,sigma);
    else
        op = H;
    end
    
    op = op - sum(op(:))/numel(op); % make the op to sum to zero
    b = imfilter(a,op,'replicate');
    
    if isempty(thresh)
        thresh = 0.75 * sum(abs(b(:)),'double') / numel(b);
    end
    
    % Look for the zero crossings:  +-, -+ and their transposes
    % We arbitrarily choose the edge to be the negative point
    [rx,cx] = find( b(rr,cc) < 0 & b(rr,cc+1) > 0 ...
        & abs( b(rr,cc)-b(rr,cc+1) ) > thresh );   % [- +]
    e((rx+1) + cx*m) = 1;
    [rx,cx] = find( b(rr,cc-1) > 0 & b(rr,cc) < 0 ...
        & abs( b(rr,cc-1)-b(rr,cc) ) > thresh );   % [+ -]
    e((rx+1) + cx*m) = 1;
    [rx,cx] = find( b(rr,cc) < 0 & b(rr+1,cc) > 0 ...
        & abs( b(rr,cc)-b(rr+1,cc) ) > thresh);   % [- +]'
    e((rx+1) + cx*m) = 1;
    [rx,cx] = find( b(rr-1,cc) > 0 & b(rr,cc) < 0 ...
        & abs( b(rr-1,cc)-b(rr,cc) ) > thresh);   % [+ -]'
    e((rx+1) + cx*m) = 1;
    
    % Most likely this covers all of the cases.   Just check to see if there
    % are any points where the LoG was precisely zero:
    [rz,cz] = find( b(rr,cc)==0 );
    if ~isempty(rz)
        % Look for the zero crossings: +0-, -0+ and their transposes
        % The edge lies on the Zero point
        zero = (rz+1) + cz*m;   % Linear index for zero points
        zz = (b(zero-1) < 0 & b(zero+1) > 0 ...
            & abs( b(zero-1)-b(zero+1) ) > 2*thresh);     % [- 0 +]'
        e(zero(zz)) = 1;
        zz = (b(zero-1) > 0 & b(zero+1) < 0 ...
            & abs( b(zero-1)-b(zero+1) ) > 2*thresh);     % [+ 0 -]'
        e(zero(zz)) = 1;
        zz = (b(zero-m) < 0 & b(zero+m) > 0 ...
            & abs( b(zero-m)-b(zero+m) ) > 2*thresh);     % [- 0 +]
        e(zero(zz)) = 1;
        zz = (b(zero-m) > 0 & b(zero+m) < 0 ...
            & abs( b(zero-m)-b(zero+m) ) > 2*thresh);     % [+ 0 -]
        e(zero(zz)) = 1;
    end
    
else  % one of the easy methods (roberts,sobel,prewitt)
    
    if isPrewittOrSobel
        isSobel = strcmp(method, 'sobel');
        scale = 4; % for calculating the automatic threshold
        offset = [0 0 0 0]; % offsets used in the computation of the threshold
        
        [bx, by, b] = edgesobelprewittmex(a, isSobel, kx, ky); 
      
    elseif strcmp(method, 'roberts')
        x_mask = [1 0; 0 -1]/2; % Roberts approximation to diagonal derivative
        y_mask = [0 1;-1  0]/2;
        
        scale = 6;
        offset = [-1 1 1 -1];
        
        % compute the gradient in x and y direction
        bx = imfilter(a,x_mask,'replicate');
        by = imfilter(a,y_mask,'replicate');
        
        % compute the magnitude
        b = kx*bx.*bx + ky*by.*by;
        
    else
        error(message('images:edge:invalidEdgeDetectionMethod', method))
    end
    
    if (nargout > 2) % if gradients are requested
        gv_45  = bx;
        gh_135 = by;
    end
    
    % Determine the threshold; see page 514 of
    % "Digital Imaging Processing" by William K. Pratt
    if isempty(thresh) % Determine cutoff based on RMS estimate of noise
        % Mean of the magnitude squared image is a
        % value that's roughly proportional to SNR
        cutoff = scale * sum(b(:),'double') / numel(b);
        thresh = sqrt(cutoff);
    else
        % Use relative tolerance specified by the user
        cutoff = (thresh).^2;
    end
    
    if thinning
        e = computeedge(b,bx,by,kx,ky,int8(offset),100*eps,cutoff);
    else
        e = b > cutoff;
    end
    
end

if nargout==0
    imshow(e);
else
    eout = e;
end

if isempty(a)
    if nargout==2
        if nargin == 2
            if strcmp(method,'canny')
                thresh = nan(1,2);
            else
                thresh = nan(1);
            end
        end
    end    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Local Function : parse_inputs
%
function [I,Method,Thresh,Sigma,Thinning,H,kx,ky] = parse_inputs(varargin)
% OUTPUTS:
%   I      Image Data
%   Method Edge detection method
%   Thresh Threshold value
%   Sigma  standard deviation of Gaussian
%   H      Filter for Zero-crossing detection
%   kx,ky  From Directionality vector

narginchk(1,5)

I = varargin{1};

validateattributes(I,{'numeric','logical'},{'real','nonsparse','2d'},mfilename,'I',1);

% Defaults
Method    = 'sobel';
Direction = 'both';
Thinning  = true;

methods    = {'canny','approxcanny','canny_old','prewitt','sobel','marr-hildreth','log','roberts','zerocross'};
directions = {'both','horizontal','vertical'};
options    = {'thinning','nothinning'};

% Now parse the nargin-1 remaining input arguments

% First get the strings - we do this because the interpretation of the
% rest of the arguments will depend on the method.
nonstr = [];   % ordered indices of non-string arguments
for i = 2:nargin
    if ischar(varargin{i})
        str = lower(varargin{i});
        j = find(strcmp(str,methods));
        k = find(strcmp(str,directions));
        l = find(strcmp(str,options));
        if ~isempty(j)
            Method = methods{j(1)};
            if strcmp(Method,'marr-hildreth')
                error(message('images:removed:syntax','EDGE(I,''marr-hildreth'',...)','EDGE(I,''log'',...)')) 
            end
        elseif ~isempty(k)
            Direction = directions{k(1)};
        elseif ~isempty(l)
            if strcmp(options{l(1)},'thinning')
                Thinning = true;
            else
                Thinning = false;
            end
        else
            error(message('images:edge:invalidInputString', varargin{ i }))
        end
    else
        nonstr = [nonstr i]; %#ok<AGROW>
    end
end

% Now get the rest of the arguments
[Thresh,Sigma,H,kx,ky] = images.internal.parseNonStringInputsEdge(varargin,Method,Direction,nonstr);
validateattributes(Thresh,{'numeric'},{'real'},mfilename,'thresh',3);

