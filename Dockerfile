FROM wlniao/dotnet:deps2.0
MAINTAINER WlniaoStudio <wlniao@qq.com>

RUN curl -SL https://dotnetcli.blob.core.windows.net/dotnet/Runtime/2.0.0/dotnet-runtime-2.0.0-linux-x64.tar.gz --output dotnet.tar.gz \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
COPY ./base /tmp/base
COPY ./wln /wln
RUN cd /tmp/base && dotnet restore && dotnet build && cd /wln && rm -rf /tmp/base
WORKDIR /wln
CMD dotnet restore && dotnet build