# greenroute docker image installation

#Build image from docker/

docker build -t ubuntu.greenroute:14.04 -f greenroute.setup .

#Create a network 

docker network create --subnet=172.18.0.0/16 greenroute.net

#Run. 

Donot forget the specify the IP. 

Additional param for hostname, no. of cpu and ram for the container could also be specified.

docker run  -d -P --net greenroute.net --ip 172.18.1.? --hostname host?.greenroute.net --name host? ubuntu.greenroute:14.04

The following param could also be used to limit the # of cpus and ram

--cpuset-cpus=""	CPUs in which to allow execution (0-3, 0,1)

-m, --memory=""	Memory limit (format: <number>[<unit>]). Number is a positive integer. Unit can be one of b, k, m, or g. Minimum is 4M.

For more details check: https://docs.docker.com/engine/reference/run/
