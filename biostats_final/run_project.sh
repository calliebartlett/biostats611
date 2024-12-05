#cd into the folder where the project is
cd biostats611/biostats_final

docker run -p 8787:8787 -p 8888:8888 -e PASSWORD=pw -v /Users/calliebartlett/biostats611:/home/rstudio/work/biostats_final -it 611 

Go to localhost:8787 and log in with password pw

#Build docker image in bash
docker build -t r-project .

#test docker image in bash 
docker run --rm -it r-project

#Run container in bash
docker run --rm -it -v $(pwd):/project r-project

