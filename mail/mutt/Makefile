PORTNAME=	mutt
DISTVERSION=	2.3.0
CATEGORIES+=	mail
MASTER_SITES=	ftp://ftp.mutt.org/pub/mutt/ \
		https://bitbucket.org/mutt/mutt/downloads/

MAINTAINER=	koue@chaosophia.net
COMMENT=	Small but powerful text based program for read/writing e-mail
WWW=		http://www.mutt.org/

LICENSE=	GPLv2+

USE_PERL5=	build

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-fcntl \
		--disable-gpgme \
		--disable-pgp \
		--disable-doc \
		--without-sqlite3 \
		--without-gss \
		--without-ssl \
		--without-gnutls \
		--without-sasl \
		--disable-full-doc \
		--enable-external-dotlock

.include <bsd.port.mk>
