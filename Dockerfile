FROM wlniao/dotnet:deps
MAINTAINER WlniaoStudio <wlniao@qq.com>

RUN apt-get update && apt-get install -y git vim && rm -rf /var/lib/apt/lists/*
RUN curl -SL https://dotnetcli.blob.core.windows.net/dotnet/Sdk/1.0.1/dotnet-dev-debian-x64.1.0.1.tar.gz --output dotnet.tar.gz \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
COPY . /wln
RUN cd /wln/base && dotnet restore && dotnet build && cd /wln && rm -rf /wln/base
WORKDIR /wln
CMD dotnet restore && dotnet build