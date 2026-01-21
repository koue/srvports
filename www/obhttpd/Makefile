PORTNAME=	obhttpd
DISTVERSION=	7.8.20260121
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

USE_RC_SUBR=	obhttpd

MAKE_ARGS+=	MANDIR=${PREFIX}/share/man/man

# XXX Static libraries with PIE are currently unsupported.
MAKE_ARGS+=	WITHOUT_PIE=true \
		SSLDIR=${WRKDIR}/libressl-${SSL} \
		EVENTDIR=${WRKSRC_libevent} \
		IMSGDIR=${WRKSRC_libimsg} \
		-DUSE_BLACKLIST

CFLAGS+=	-Wall -fcommon

USERS=		www
GROUPS=		www

SSL=		4.2.1
LIBEVENT=	7.3.20230714
LIBIMSG=	7.3.20230714

post-patch:
	${REINPLACE_CMD} -e 's|libimsg/src||g' \
			 -e 's|libevent||g' ${WRKSRC}/Makefile
	${REINPLACE_CMD} -e 's|httpd$$|obhttpd|g' \
			 -e 's|httpd.conf.5|obhttpd.conf.5|g' \
			 -e 's|httpd.8|obhttpd.8|g' ${WRKSRC}/src/usr.sbin/httpd/Makefile
	${REINPLACE_CMD} -e 's|htpasswd$$|obhtpasswd|g' \
			 -e 's|htpasswd.1|obhtpasswd.1|g' ${WRKSRC}/src/usr.bin/htpasswd/Makefile
	${MV} ${WRKSRC}/src/usr.bin/htpasswd/htpasswd.1 ${WRKSRC}/src/usr.bin/htpasswd/obhtpasswd.1
	${MV} ${WRKSRC}/src/usr.sbin/httpd/httpd.conf.5 ${WRKSRC}/src/usr.sbin/httpd/obhttpd.conf.5
	${MV} ${WRKSRC}/src/usr.sbin/httpd/httpd.8 ${WRKSRC}/src/usr.sbin/httpd/obhttpd.8
	${REINPLACE_CMD} -e 's|/etc/httpd.conf|${PREFIX}/etc/obhttpd.conf|g' \
		${WRKSRC}/src/usr.sbin/httpd/httpd.h

pre-configure:
	@(cd ${WRKDIR} && ${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${DISTDIR}/libressl-${SSL}.tar.gz ${EXTRACT_AFTER_ARGS})
	@(cd ${WRKDIR}/libressl-${SSL} && ${SETENV} ac_cv_header_endian_h=no ./configure && ${SETENV} ${MAKE_ENV} ${MAKE})
	@(cd ${WRKSRC_libimsg} && ${SETENV} ${MAKE_ENV} ${MAKE})
	@(cd ${WRKSRC_libevent} && ${SETENV} ${MAKE_ENV} ${MAKE})

post-install:
	${INSTALL_DATA} ${WRKSRC}/src/etc/examples/httpd.conf \
		${STAGEDIR}${PREFIX}/etc/obhttpd.conf.sample

do-test:
	@cd ${WRKSRC}/src/regress/usr.sbin/httpd/tests && \
		HTTPD=../../../../usr.sbin/httpd/obhttpd make

.include <bsd.port.mk>
