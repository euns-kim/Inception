# Use the penultimate version of Alpine Linux
FROM alpine:3.18

ENV PHP_VERSRION=8

RUN apk update && apk upgrade && \
	apk add --no-cache \
	php${PHP_VERSRION} \
	php${PHP_VERSRION}-fpm \
	php${PHP_VERSRION}-mysqli \
	php${PHP_VERSRION}-xml \
	wget \
	unzip && \
	sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
		/etc/php8/php-fpm.d/www.conf && \
	sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
		/etc/php8/php-fpm.d/www.conf && \
	sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
		/etc/php8/php-fpm.d/www.conf && \
	rm -f /var/cache/apk/*

COPY ./tools/wordpress_init.sh /tmp/wordpress_init.sh

RUN chmod +x /tmp/wordpress_init.sh && \
	wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	rm latest.zip && \
	mv wordpress /var/www/wordpress

WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["/tmp/wordpress_init.sh"]