@echo off
docker-machine start
docker-machine ip > hostname.txt
set /p REN_RT_EXTERNAL_IP=<hostname.txt
del hostname.txt
echo Host-ip: %REN_RT_EXTERNAL_IP%

docker pull sbroh/mcc2019:latest

docker run -d --rm --name mcc2019 -p  %REN_RT_EXTERNAL_IP%:8889:8889 --hostname mcc2019 --env HOST_UID= -v ~/Dropbox/MCC-share:/home/ubuntu/shared -w "/home/ubuntu/shared" sbroh/mcc2019:latest jupyter-notebook --no-browser --ip=0.0.0.0 --port 8889 --NotebookApp.token=''

set url="http://%REN_RT_EXTERNAL_IP%:8889/"

REM start iexplore.exe %url%
REM start chrome %url%
REM start firefox.exe %url%
start microsoft-edge:%url%

pause
