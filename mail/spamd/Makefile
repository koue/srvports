PORTNAME=	spamd
PORTVERSION=	7.7.20250916
CATEGORIES=	mail

MAINTAINER=	koue@chaosophia.net
COMMENT=	Traps spammers with a very slow smtp-login and return 4xx error
WWW=		https://github.com/koue/spamd

USE_GITHUB=	yes
GH_ACCOUNT=	koue
GH_PROJECT=	spamd

LIB_DIRS+=      /usr/local/lib
CFLAGS+=        -I/usr/local/include
LDFLAGS+=       -L/usr/local/lib

USE_RC_SUBR=	obspamd

USERS=		_spamd
GROUPS=		_spamd

PLIST_FILES=	etc/spamd/spamd.conf.sample \
		sbin/add-spamd-to-etc-service \
		sbin/spamd-setup \
		sbin/spamdb \
		share/man/man8/spamd-setup.8.gz \
		share/man/man8/spamd.8.gz \
		share/man/man8/spamdb.8.gz \

SUB_LIST=	SPAMDUSER=${USERS} \
		SPAMDGROUP=${GROUPS}

PLIST_FILES+=	libexec/spamd
SUB_LIST+=	SPAMDBIN=spamd

SUB_FILES=	pkg-install \
		pkg-message

.include <bsd.port.pre.mk>

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/libexec/spamd/spamd ${STAGEDIR}${PREFIX}/libexec
	${INSTALL_PROGRAM} ${WRKSRC}/src/libexec/spamd-setup/spamd-setup ${STAGEDIR}${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/src/usr.sbin/spamdb/spamdb ${STAGEDIR}${PREFIX}/sbin
	#${INSTALL_MAN} ${WRKSRC}/etc/spamd.conf.5 ${STAGEDIR}${PREFIX}/share/man/man5
	${INSTALL_MAN} ${WRKSRC}/src/libexec/spamd/spamd.8 ${STAGEDIR}${PREFIX}/share/man/man8
	${INSTALL_MAN} ${WRKSRC}/src/libexec/spamd-setup/spamd-setup.8 ${STAGEDIR}${PREFIX}/share/man/man8
	${INSTALL_MAN} ${WRKSRC}/src/usr.sbin/spamdb/spamdb.8 ${STAGEDIR}${PREFIX}/share/man/man8
	@${MKDIR} ${STAGEDIR}${ETCDIR}
	${INSTALL_DATA} ${FILESDIR}/spamd.conf.sample ${STAGEDIR}${ETCDIR}/spamd.conf.sample

	#@${MKDIR} ${STAGEDIR}${DOCSDIR}
	#${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/doc/|} ${STAGEDIR}${DOCSDIR}/

	${INSTALL_SCRIPT} ${FILESDIR}/add-spamd-to-etc-service ${STAGEDIR}${PREFIX}/sbin/

.include <bsd.port.post.mk>
