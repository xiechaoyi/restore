FROM wlniao/dotnet:2.0.3-sdk
MAINTAINER WlniaoStudio <wlniao@qq.com>

COPY ./base /tmp/base
COPY ./wln /wln
RUN cd /tmp/base 
RUN dotnet restore
RUN dotnet build 
RUN cd /wln && rm -rf /tmp/base
WORKDIR /wln
ENTRYPOINT ["/bin/bash", "/wln/run.sh"]