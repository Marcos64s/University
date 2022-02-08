import numpy as np
import cv2

with np.load ('kinect params.npz') as data :
	intrinsicsRGB = data['camera_matrix']
	distortionRGB = data['dist_coefs']
print('IntrinsicsRGB:')
print ( intrinsicsRGB)
print('DistortionRGB:')
print ( distortionRGB)

with np.load ('kinect paramsIR.npz') as data :
	intrinsicsIR = data['camera_matrix']
	distortionIR = data['dist_coefs']
print('IntrinsicsIR:')
print ( intrinsicsIR )
print('DistortionIR:')
print ( distortionIR )

with np.load ('img_pointsIR.npz') as data :
	img_pointsIR= data['img_pointsIR']

with np.load ('img_pointsRGB.npz') as data :
	img_pointsRGB= data['img_pointsRGB']

with np.load ('obj_points.npz') as data :
	obj_points= data['obj_points']

img_pointsIR=img_pointsIR[0:len(img_pointsRGB)]


retval_stereo,intrinsicsRGB,distortionRGB,intrinsicsIR,distortionIR,R,T,E,F=cv2.stereoCalibrate(
    obj_points,
    img_pointsRGB,
    img_pointsIR,
    intrinsicsRGB,distortionRGB,intrinsicsIR,distortionIR,(512,424))
print('T:')
print(T)
print('R:')
print(R)
print('E:')
print(E)
print('F:')
print(F)

#np.savez("Stereo_Extrinsic.npz",T=T,R=R,E=E,F=F)

