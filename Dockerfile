FROM microsoft/dotnet:latest
MAINTAINER WlniaoStudio <ideploy@wlniao.com>
EXPOSE 5000
COPY . /wln
WORKDIR /wln
CMD dotnet restore && dotnet run