FROM debian:bullseye
MAINTAINER Filidor Wiese <fili@fili.nl>

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Add timezone information
RUN echo "Europe/Amsterdam" > /etc/timezone
ENV TZ Europe/Amsterdam

# Install base dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl wget nano less ncat \
        openssh-server \
        proftpd \
        proftpd-mod-mysql \
        proftpd-mod-crypto

# Configure proftpd
COPY conf.d/* /etc/proftpd/conf.d/
RUN echo '\n\
LoadModule mod_sql.c\n\
LoadModule mod_sql_mysql.c\n\
LoadModule mod_sftp.c\n\
LoadModule mod_sftp_sql.c\n\
' >> /etc/proftpd/modules.conf

# Ensures logs are directored to docker-logs
RUN ln -sf /dev/stderr /var/log/proftpd/proftpd.log && \
    ln -sf /dev/stderr /var/log/proftpd/xferlog

CMD ["proftpd", "--nodaemon"]
