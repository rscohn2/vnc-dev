FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y \
          emacs \
	  git \
	  tightvncserver \
          xfce4 \
	  xfce4-goodies
RUN groupadd -g 1004 rscohn1\
    && useradd -u 1003 -g 1004 -ms /bin/bash rscohn1
USER rscohn1
WORKDIR /home/rscohn1
ENV USER rscohn1
COPY run-vnc.sh /opt/
EXPOSE 5910
CMD ["/opt/run-vnc.sh"]




