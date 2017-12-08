FROM ideploy/restore:sdk

ADD ./base /tmp/base
ADD ./wln /wln
RUN cd /tmp/base && dotnet restore && dotnet build 
RUN cd /wln && rm -rf /tmp/base
WORKDIR /wln
ENTRYPOINT ["/bin/bash", "/wln/run.sh"]