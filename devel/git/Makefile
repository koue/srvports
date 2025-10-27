PORTNAME=	git
DISTVERSION=	2.51.1
CATEGORIES=	devel
MASTER_SITES=	KERNEL_ORG/software/scm/git

MAINTAINER=	koue@chaosophia.net
COMMENT=	Distributed source code management tool git
WWW=		https://git-scm.com/

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake tar:xz

GNU_CONFIGURE=	yes

CONFIGURE_ARGS=	--enable-pthreads=-pthread \
		--without-openssl \
		--without-expat \
		--without-curl \
		--without-tcltk \
		--without-iconv

.include <bsd.port.mk>
