FROM debian:stable
RUN apt-get update && apt-get install -y \
    gcc 
ENV CLOUD docker
COPY benchmarks benchmarks
CMD  cd benchmarks && ./measure-cpu.sh
