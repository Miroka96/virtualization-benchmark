FROM debian:stable
RUN apt-get update && apt-get install -y \
    fio 
ENV CLOUD DOCKER
COPY benchmarks benchmarks
CMD  cd benchmarks && ./measure-disk-random.sh