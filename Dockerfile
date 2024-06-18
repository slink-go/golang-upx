ARG GOLANG_VERSION
ARG UPX_VERSION

FROM golang:${GOLANG_VERSION} as main-linux-arm64
ARG GOLANG_VERSION
ARG UPX_VERSION
RUN apt update -y && apt install -y wget libucl1 zip && \
    wget http://ftp.de.debian.org/debian/pool/main/u/upx-ucl/upx-ucl_${UPX_VERSION}_arm64.deb &&\
    dpkg -i $(ls *.deb)

FROM golang:${GOLANG_VERSION} as main-linux-amd64
ARG GOLANG_VERSION
ARG UPX_VERSION
RUN apt update -y && apt install -y wget libucl1 zip && \
    wget http://ftp.de.debian.org/debian/pool/main/u/upx-ucl/upx-ucl_${UPX_VERSION}_amd64.deb &&\
    dpkg -i $(ls *.deb)

FROM main-${TARGETOS}-${TARGETARCH}${TARGETVARIANT}
