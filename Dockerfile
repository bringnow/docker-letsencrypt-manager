FROM quay.io/letsencrypt/letsencrypt:latest

MAINTAINER Fabian Köster <fabian.koester@bringnow.com>

# This holds the webroot required for ACME authentication
VOLUME /var/acme-webroot

# Install runtime dependency
RUN apt-get update && apt-get install -y bsdmainutils --no-install-recommends

# Add crontab file in the cron directory
COPY crontab /etc/cron.d/letsencrypt

# Copy executables
COPY bin/* /usr/local/bin/

# Copy letsencrypt configuration file
COPY cli.ini /root/.config/letsencrypt/

# Give execution rights to scripts
RUN chmod 0744 /etc/cron.d/letsencrypt /usr/local/bin/*

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

# Run the command on container startup
CMD ["help"]
