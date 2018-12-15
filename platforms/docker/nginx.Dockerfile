FROM debian:stable
RUN apt-get update && apt-get install -y \
    nginx 
ENV CLOUD DOCKER
COPY benchmarks benchmarks
CMD  cd benchmarks && ./measure-nginx.sh