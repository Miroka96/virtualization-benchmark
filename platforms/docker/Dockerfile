FROM debian:stable
RUN apt-get update && apt-get install -y \
    gcc \
    fio 
COPY ../benchmarks benchmarks
RUN 