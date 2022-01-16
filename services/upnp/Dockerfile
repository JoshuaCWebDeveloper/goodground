FROM alpine:latest

RUN apk update
RUN apk add bash
RUN apk add miniupnpc

RUN mkdir /scripts
WORKDIR /scripts
COPY upnp.sh .
RUN chmod a+x ./upnp.sh

# cron to update each UPnP entries every 10 minutes
RUN echo -e "*/10\t*\t*\t*\t*\tbash /scripts/upnp.sh" >> /etc/crontabs/root
 
# Run the command on container startup
CMD ["cron", "-f"]

# on start, open needed ports
ENTRYPOINT bash upnp.sh