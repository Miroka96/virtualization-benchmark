FROM debian:stable

COPY prepare.sh .
RUN chmod +x prepare.sh && ./prepare.sh

# requirement for performance stats
RUN apt update && apt install -y smartmontools dmidecode
COPY platforms/performanceStats.sh .
RUN chmod +x performanceStats.sh

CMD ./performanceStats.sh
