FROM debian:latest

MAINTAINER Dolma and Sumaiyah

RUN apt-get update 
RUN apt-get install -y apache2 \
    libapache2-mod-wsgi-py3 \
    build-essential \
    python3 \
    python3-dev\
    python3-pip \
 && apt-get clean \
 && apt-get autoremove \
 && rm -rf /var/lib/apt/lists/*


COPY ./requirements.txt /var/www/devbops_user_microservice/requirements.txt
RUN pip3 install -r /var/www/devbops_user_microservice/requirements.txt

# Apache config file
COPY ./user.conf /etc/apache2/sites-available/user.conf
RUN a2ensite user
RUN a2enmod headers

# wsgi config file Mod_wsgi
COPY ./user.wsgi /var/www/devbops_user_microservice/user.wsgi

####################
COPY ./devbops_user_microservice /var/www/devbops_user_microservice/devbops_user_microservice

RUN a2dissite 000-default.conf
RUN a2ensite user.conf

#### LINK LOGS
RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

EXPOSE 80
WORKDIR /var/www/devbops_user_microservice

CMD  /usr/sbin/apache2ctl -D FOREGROUND
