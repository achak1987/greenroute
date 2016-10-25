# greenroute docker image installation
#Build image 
docker build -t ubuntu.greenroute:14.04 -f greenroute.setup .

#Run
docker run -d -P --name greenroute ubuntu.greenroute:14.04

#To check the port for ssh
docker port greenroute 22

#To check the IP address
docker inspect greenroute

#SSH using user name
ssh greenroute@ip.address -p port.number

#SSH using public key
ssh greenroute@ip.address
