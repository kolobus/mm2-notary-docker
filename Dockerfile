FROM ubuntu:18.04
RUN apt-get update && apt-get install -y curl unzip jq

WORKDIR /

RUN curl $(curl https://api.github.com/repos/KomodoPlatform/atomicDEX-API/releases --location | jq -r '.[0].assets | map(select(.name | contains("Linux-Release."))) | .[0].browser_download_url') --location --output mm2.zip && unzip mm2.zip && rm mm2.zip

RUN curl https://raw.githubusercontent.com/KomodoPlatform/coins/master/coins --location --output /coins

COPY . /
CMD /entry.sh
