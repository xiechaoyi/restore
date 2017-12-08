FROM wlniao/dotnet:2.0.3-sdk

ONBUILD COPY . /wln
ONBUILD WORKDIR /wln
ONBUILD ENTRYPOINT ["/bin/bash", "/wln/run.sh"]