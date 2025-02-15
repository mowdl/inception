FROM debian:11


RUN apt-get update && apt-get install -y vsftpd --no-install-recommends; apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i 's/anonymous_enable=NO/anonymous_enable=YES/' /etc/vsftpd.conf

RUN mkdir /wordpress && usermod -d /wordpress ftp

RUN mkdir -p /var/run/vsftpd/empty

CMD ["vsftpd"]
