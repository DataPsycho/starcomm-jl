FROM julia:1.5.3-buster


RUN apt-get update && apt-get install -y gcc
ENV JULIA_PROJECT @.

ENV REPO_URL=StarComm

COPY . $REPO_URL
WORKDIR $REPO_URL

RUN julia deploy/packagecompile.jl
# RUN julia deploy/nocompile.jl

EXPOSE 8080
ENTRYPOINT ["julia", "--threads", "2", "-JStarComm.so", "-e", "StarComm.run()"]
# ENTRYPOINT ["julia", "--threads", "2", "serve.jl"]
