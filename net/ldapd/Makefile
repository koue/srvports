PORTNAME=	ldapd
DISTVERSION=	7.8.20260224
CATEGORIES=	net
MASTER_SITES=	OPENBSD/LibreSSL:libressl
DISTFILES=	libressl-${SSL_VERSION}.tar.gz:libressl

MAINTAINER=	koue@chaosophia.net
COMMENT=	OpenBSD ldap server
WWW=		https://github.com/koue/ldapd

LICENSE=	BSD3CLAUSE

SSL_VERSION=	4.2.1
LIBEVENT_VERSION=	7.5.20240604
LIBIMSG_VERSION=7.7.20250620
USE_GITHUB=	yes
GH_ACCOUNT=	koue
GH_PROJECT=	ldapd \
		libevent:libevent \
		libimsg:libimsg
GH_TAGNAME=	${LIBIMSG_VERSION}:libimsg \
		${LIBEVENT_VERSION}:libevent

#USE_RC_SUBR=	ldapd
USES=		uidfix

# XXX Static libraries with PIE are currently unsupported.
MAKE_ARGS+=	WITHOUT_PIE=true \
		BINDIR=${PREFIX}/sbin \
		MANDIR=${PREFIX}/share/man/man \
		SSLDIR=${WRKDIR}/libressl-${SSL_VERSION} \
		EVENTDIR=${WRKSRC_libevent} \
		IMSGDIR=${WRKSRC_libimsg}

CFLAGS+=	-Wall -fcommon

USERS=		ldap
GROUPS= 	ldap

post-patch:
	${REINPLACE_CMD} -e 's|libimsg/src||g' \
			 -e 's|libevent||g' ${WRKSRC}/Makefile
	${REINPLACE_CMD} -e 's|/etc/ldapd.conf|${PREFIX}/etc/ldapd.conf|g' \
		${WRKSRC}/src/usr.sbin/ldapd/ldapd.h
	# FIXME
	${REINPLACE_CMD} -e '697d' ${WRKSRC_libimsg}/src/lib/libutil/imsg-buffer.c

pre-configure:
	@(cd ${WRKDIR} && ${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${DISTDIR}/libressl-${SSL_VERSION}.tar.gz ${EXTRACT_AFTER_ARGS})
	@(cd ${WRKDIR}/libressl-${SSL_VERSION} && ${SETENV} ./configure && ${SETENV} ${MAKE_ENV} ${MAKE})
	@(cd ${WRKSRC_libimsg} && ${SETENV} ${MAKE_ENV} ${MAKE})
	@(cd ${WRKSRC_libevent} && ${SETENV} ${MAKE_ENV} ${MAKE})

post-install:
	${INSTALL_DATA} ${WRKSRC}/src/etc/examples/ldapd.conf \
		${STAGEDIR}${PREFIX}/etc/ldapd.conf.sample

.include <bsd.port.mk>
