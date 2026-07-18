PORTNAME=	httpd
DISTVERSION=	7.9.20260717
CATEGORIES=	www
MASTER_SITES=	OPENBSD/LibreSSL:libressl
DISTFILES=	libressl-${SSL}.tar.gz:libressl

MAINTAINER=	koue@chaosophia.net
COMMENT=	OpenBSD http server
WWW=		https://github.com/koue/httpd

LICENSE=	BSD3CLAUSE

USES=		uidfix

USE_GITHUB=	yes
GH_ACCOUNT=	koue
GH_PROJECT=	httpd \
		libevent:libevent \
		libimsg:libimsg
GH_TAGNAME=	${LIBIMSG}:libimsg \
		${LIBEVENT}:libevent

USE_RC_SUBR=	httpd

MAKE_ARGS+=	MANDIR=${PREFIX}/share/man/man

# XXX Static libraries with PIE are currently unsupported.
MAKE_ARGS+=	WITHOUT_PIE=true \
		SSLDIR=${WRKDIR}/libressl-${SSL} \
		EVENTDIR=${WRKSRC_libevent} \
		IMSGDIR=${WRKSRC_libimsg} \
		-DUSE_BLOCKLIST \
		-DBLOCK_POST \
		-DBLOCK_400

CFLAGS+=	-Wall -fcommon

USERS=		www
GROUPS=		www

SSL=		4.3.2
LIBEVENT=	7.9.20260709
LIBIMSG=	7.3.20230714

post-extract:
	@(cd ${WRKDIR} && ${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${DISTDIR}/libressl-${SSL}.tar.gz ${EXTRACT_AFTER_ARGS})
	@(cd ${WRKDIR}/libressl-${SSL} && ${SETENV} ac_cv_header_endian_h=no ./configure && ${SETENV} ${MAKE_ENV} ${MAKE})
	@(cd ${WRKSRC_libimsg} && ${SETENV} ${MAKE_ENV} ${MAKE})
	@(cd ${WRKSRC_libevent} && ${SETENV} ${MAKE_ENV} ${MAKE})

post-patch:
	${REINPLACE_CMD} -e 's|libimsg/src||g' \
			 -e 's|libevent||g' ${WRKSRC}/Makefile

post-install:
	${INSTALL_DATA} ${WRKSRC}/src/etc/examples/httpd.conf \
		${STAGEDIR}${PREFIX}/etc/httpd.conf.sample

do-test:
	@cd ${WRKSRC}/src/regress/usr.sbin/httpd/tests && \
		HTTPD=../../../../usr.sbin/httpd/httpd make

.include <bsd.port.mk>
