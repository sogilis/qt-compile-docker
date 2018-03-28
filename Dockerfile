FROM phusion/baseimage:0.10.0

RUN add-apt-repository ppa:beineri/opt-qt-5.10.1-xenial \
    && apt-get update \
    && apt-get install wget \
    && apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" \
    && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
    && apt-get update \
    && apt-get install -y --no-install-recommends  \
        build-essential cmake curl python3 python3-pip wget qt510base qt510location \
        mesa-common-dev clang-format-6.0 \
    && ln -s /usr/bin/clang-format-6.0 /usr/local/bin/clang-format \
    && pip3 install conan \
    && conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan \
    # Clean up APT when done.
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /root/.conan
