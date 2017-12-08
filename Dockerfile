FROM wlniao/dotnet:deps2.0
MAINTAINER WlniaoStudio <wlniao@qq.com>

RUN curl -SL https://www.microsoft.com/net/download/thank-you/dotnet-sdk-2.0.3-linux-x64-binaries --output dotnet.tar.gz
RUN mkdir -p /usr/share/dotnet \
    && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
COPY ./base /tmp/base
COPY ./wln /wln
RUN cd /tmp/base 
RUN dotnet restore
RUN dotnet build 
RUN cd /wln && rm -rf /tmp/base
WORKDIR /wln
CMD dotnet restore && dotnet build