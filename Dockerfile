FROM ubuntu:16.04

# Update repositories and update system
RUN apt-get update -y && apt-get upgrade -y

# Install language-pack and add repository
RUN apt-get install -y software-properties-common vim
RUN apt-get install -y language-pack-en-base
RUN LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php && apt-get update -y

# Install Apache
RUN apt-get install apache2 -y
RUN a2enmod rewrite

# Install PHP 5.6
RUN apt-get install -y php5.6 \
  php5.6-mbstring \
  php5.6-mcrypt \
  php5.6-mysql \
  php5.6-xml \
  php5.6-intl \
  php5.6-cli \
  php5.6-gd \
  php5.6-curl \
  php5.6-sqlite3 \
  php5.6-json \
	php5.6-zip \
	php5.6-xmlrpc \
	php5.6-soap \
	php5.6-uploadprogress \
  libapache2-mod-php5.6

# ENTRYPOINT
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]