FROM ubuntu:14.04
MAINTAINER Mark Hollow

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y curl wget \
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

ADD opencv-3.1.0.tar.xz /root
RUN mkdir -p /root/opencv/build && cd /root/opencv/build && \
	cmake -D CMAKE_BUILD_TYPE=RELEASE \
		-D CMAKE_INSTALL_PREFIX=/usr/local \
		-D INSTALL_C_EXAMPLES=OFF \
		-D INSTALL_PYTHON_EXAMPLES=ON \
		-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
		-D BUILD_EXAMPLES=ON .. && \
	make -j8 && make install && ldconfig && rm -rf /root/opencv_contrib /root/opencv /root/opencv-3.1.0.tar.xz
