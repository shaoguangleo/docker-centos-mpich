FROM shaoguangleo/centos-ipp:latest
MAINTAINER [Guo Shaoguang] <sgguo@shao.ac.cn>

LABEL version="0.1"
LABEL description="CentOS MPICH Image"

ENV MPICH_VERSION=3.2.1

COPY src/* /tmp/

RUN cd /tmp/ \
    && yum update -y \
    && yum install -y libtool* \
    && tar zxvf  mpich-$MPICH_VERSION.tar.gz \
    && cd /tmp/mpich-$MPICH_VERSION \
    && ./configure 2>&1 | tee log_configure.txt \
    && make 2>&1 | tee log_make.txt \
    && make install 2>&1 | tee log_make_install.txt \
    && echo "echo '    _      ____     ___    ____  '" >> ~/.bashrc \
    && echo "echo '   / \    / ___|   / _ \  |  _ \ '" >> ~/.bashrc \
    && echo "echo '  / _ \   \___ \  | | | | | | | |'" >> ~/.bashrc \
    && echo "echo ' / ___ \   ___) | | |_| | | |_| |'" >> ~/.bashrc \
    && echo "echo '/_/   \_\ |____/   \___/  |____/ '" >> ~/.bashrc \
    && echo "echo ' '" >> ~/.bashrc \
    && echo "echo 'Details On <https://www.github.com/shaoguangleo/AstroSoft> '" >> ~/.bashrc\
    && rm -rvf /tmp/*
