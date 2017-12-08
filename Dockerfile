FROM wlniao/dotnet:deps2.0
MAINTAINER WlniaoStudio <wlniao@qq.com>

RUN curl -SL https://download.microsoft.com/download/D/7/2/D725E47F-A4F1-4285-8935-A91AE2FCC06A/dotnet-sdk-2.0.3-linux-x64.tar.gz --output dotnet.tar.gz \
    && mkdir -p /usr/share/dotnet \
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