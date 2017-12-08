FROM wlniao/dotnet:2.0.3-sdk
MAINTAINER WlniaoStudio <wlniao@qq.com>

WORKDIR /wln
ENTRYPOINT ["/bin/bash", "/wln/run.sh"]