IMAGE_NAME=fastai_v1_cpu

.phony: build
build:
	docker build . -t ${IMAGE_NAME}
	echo ##
	echo ## To run, go to the fastai directory
	echo ## type:
	echo ## docker run -it --rm -p 8888:8888 -v `pwd`:/code ${IMAGE_NAME}
	echo ## visit http://localhost:8888 with your token

