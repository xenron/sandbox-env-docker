FROM debian:jessie

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
        graphite-web \
        apache2 \
        libapache2-mod-wsgi

ADD local_settings.py /etc/graphite/local_settings.py
RUN ln -sf /usr/share/graphite-web/apache2-graphite.conf \
           /etc/apache2/sites-available/100-graphite.conf && \
    a2dissite 000-default && a2ensite 100-graphite && \
    mkdir -p /graphite/storage && \
    graphite-manage syncdb --noinput && \
    chown -R _graphite:_graphite /graphite

EXPOSE 80
ENTRYPOINT ["apachectl", "-DFOREGROUND"]
