# Dockerfile for AutostatsQ
# Useful Docker commands:
# sudo docker build -t "autostatsq:1" .
# sudo docker run -it --name autostatsq autostatsq:1 /bin/bash
# sudo docker rm autostatsq
# sudo docker start/stop autostatsq
# sudo docker exec -it autostatsq /bin/bash


# ******************** Base OS ***********************************************
# get Ubuntu 18.04 image
FROM ubuntu:18.04
RUN apt update -y


# ******************** METADATA **********************************************
LABEL version="1.0"
LABEL software="AutoStatsQ Docker"
LABEL software.version="1.0"
LABEL about.summary="Docker containerization of the AutoStatsQ software"
LABEL about.license_file="https://www.gnu.org/licenses/gpl-3.0.html"
LABEL about.license="SPDX:GPL-3.0-only"
LABEL maintainer="triantafyl@noa.gr"


# ******************** INSTALLATION ******************************************

# install Python3 and some matplotlib dependencies
RUN apt install -y python3 python3-pip python3-dev libxft-dev libfreetype6 \
libfreetype6-dev

# install GMT v.5.4.5 from local tar file
RUN apt install -y ghostscript build-essential cmake libnetcdf-dev \
libfftw3-dev libpcre3-dev
RUN apt install -y gdal-bin wget
#RUN wget ftp://ftp.iris.washington.edu/pub/gmt/gmt-5.4.5-src.tar.xz
#RUN tar xf ./gmt-5.4.5-src.tar.xz
#RUN rm -fr ./gmt-5.4.5/build && mkdir ./gmt-5.4.5/build
#RUN cd ./gmt-5.4.5/build && \
#    cmake -DCMAKE_INSTALL_PREFIX=/usr \
#      -DGSHHG_ROOT=/usr/share/gmt/coast \
#      -DGMT_LIBDIR=lib \
#      -DDCW_ROOT=/usr/share/gmt/dcw \
#      -DGMT_DATADIR=share/gmt \
#      -DGMT_MANDIR=share/man \
#      -DGMT_DOCDIR=share/doc/gmt \
#      -DCMAKE_BUILD_TYPE=Release .. && \
#    make && make install

RUN apt install -y gmt gmt-dcw gmt-gshhg

# install pyrocko with dependencies (matplotlib etc.)
RUN apt install -y make git python3-dev python3-setuptools
RUN DEBIAN_FRONTEND="noninteractive" apt install -y tzdata
RUN apt install -y python3-numpy python3-numpy-dev python3-scipy \
python3-matplotlib
RUN apt install -y python3-pyqt4 python3-pyqt4.qtopengl
RUN apt install -y python3-pyqt5 python3-pyqt5.qtopengl python3-pyqt5.qtsvg
RUN apt install -y python3-pyqt5.qtwebengine || apt install -y \
python3-pyqt5.qtwebkit
RUN apt install -y python3-yaml python3-progressbar python3-jinja2
RUN apt install -y python3-requests
RUN apt install -y python3-future
RUN apt install -y bash-completion
RUN git clone https://git.pyrocko.org/pyrocko/pyrocko.git pyrocko
RUN cd pyrocko && python3 setup.py install

# install grond
RUN git clone https://git.pyrocko.org/pyrocko/grond.git
RUN cd grond && python3 setup.py install

RUN apt install -y poppler-utils imagemagick
# install AutoStatsQ
RUN git clone https://github.com/gesape/AutoStatsQ AutoStatsQ

# Modify Timeout for FDSN
RUN sed -i '0,/from pyrocko.client import catalog, fdsn/s//from pyrocko.client import catalog, fdsn\nfdsn.g_timeout = 60.\n/' AutoStatsQ/src/network_control.py

# setup AutoStatsQ
RUN cd AutoStatsQ && python3 setup.py install


# vault contains all data stuff
RUN mkdir -p /vault

# archive is a link to the SDS structure
RUN mkdir -p /archive

RUN mkdir -p /root/.config/matplotlib && echo "backend: Agg" > ~/.config/matplotlib/matplotlibrc
