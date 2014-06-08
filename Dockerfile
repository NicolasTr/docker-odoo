FROM phusion/baseimage:0.9.10
MAINTAINER Nicolas Tresegnie <nicolas.tresegnie@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -q -y --no-install-recommends wget gdebi \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.npm

RUN apt-get update \
    && cd /tmp \
    && wget http://nightly.openerp.com/7.0/nightly/deb/openerp_7.0-20140607-231102-1_all.deb -O openerp_7.0.deb \
    && gdebi openerp_7.0.deb --non-interactive \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.npm

ADD ./etc/service/openerp-server /etc/service/openerp-server

CMD ["/sbin/my_init"]
