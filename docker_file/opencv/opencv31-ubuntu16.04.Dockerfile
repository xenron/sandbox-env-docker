FROM ubuntu:16.04
MAINTAINER Mark Hollow

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y curl wget vim ssh \
		build-essential cmake git pkg-config python2.7-dev git \
		libjpeg8-dev libtiff4-dev libjasper-dev libpng12-dev \
		libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
		libatlas-base-dev gfortran python2.7 && \
	apt-get remove --purge man && \
	apt-get clean -y && \
	curl -o - https://bootstrap.pypa.io/get-pip.py | python2.7 && \
	useradd -ms /bin/bash -d /app -c 'App User' appuser && \
	pip install numpy msgpack-python ujson && \
	rm -rf /root/.pip/cache/* /tmp/pip*
RUN cd /opt && \
    git clone https://github.com/Itseez/opencv.git && \
    cd /opt/opencv/ && \
    git checkout -b 3.1.0
RUN cd /opt && \
    git clone https://github.com/Itseez/opencv_contrib.git && \
    cd /opt/opencv_contrib/ && \
    git checkout -b 3.1.0

RUN mkdir -p /opt/opencv/build && \
    cd /opt/opencv/build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
		-D CMAKE_INSTALL_PREFIX=/usr/local \
		-D INSTALL_C_EXAMPLES=OFF \
		-D INSTALL_PYTHON_EXAMPLES=ON \
		-D OPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib/modules \
		-D BUILD_EXAMPLES=ON .. && \
	make -j8 && make install && ldconfig


# RUN echo -e "#include <iostream> \n #include <opencv2/opencv.hpp> \n using namespace cv; \n using namespace std; \n int main( int argc, char* argv[]){ \n Mat image=imread(argv[1]); \n cout << image.rows*image.cols << endl; \n }" > /opt/test_opencv.cpp
# RUN g++ -o /opt/test_opencv /opt/test_opencv.cpp -lopencv_core -lopencv_highgui -lopencv_imgcodecs -lopencv_imgproc -lstdc++
# RUN /opt/test_opencv /opt/opencv/samples/data/HappyFish.jpg

