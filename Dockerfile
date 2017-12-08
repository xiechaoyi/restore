FROM wlniao/dotnet:2.0.3-sdk
MAINTAINER WlniaoStudio <wlniao@qq.com>

ADD ./base /tmp/base
ADD ./wln /wln
RUN cd /tmp/base 
RUN dotnet restore
RUN dotnet build 
RUN cd /wln && rm -rf /tmp/base
WORKDIR /wln
ENTRYPOINT ["/bin/bash", "/wln/run.sh"]