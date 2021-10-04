FROM ubuntu:18.04
RUN apt-get update && apt-get install -y curl unzip

WORKDIR /

RUN curl https://github.com/KomodoPlatform/atomicDEX-API/releases/download/beta-2.1.3690/mm2-1512af867-Linux-Debug.zip --location --output mm2.zip && unzip mm2.zip && rm mm2.zip

RUN curl https://raw.githubusercontent.com/KomodoPlatform/coins/master/coins --location --output /coins

COPY . /
CMD /entry.sh
