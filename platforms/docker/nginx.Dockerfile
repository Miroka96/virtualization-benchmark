FROM debian:stable
RUN apt-get update && apt-get install -y \
    nginx
ENV CLOUD docker
COPY benchmarks benchmarks
RUN cd benchmarks && ./nginx-prepare.sh
EXPOSE 80
CMD nginx -g "daemon off;"
