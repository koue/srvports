PORTNAME=	graffer
PORTVERSION=	1.5.1
PORTREVISION=	1
CATEGORIES=	sysutils

MAINTAINER=	koue@chaosophia.net
COMMENT=	Utility to render graphical statistics
WWW=		http://chaosophia.net/graffer/

USE_GITHUB=	yes
GH_ACCOUNT=	koue
GH_PROJECT=	graffer

LIB_DEPENDS=	libpng.so:graphics/png
LIB_DIRS+=	/usr/local/lib
CFLAGS+=	-I/usr/local/include
LDFLAGS+=	-L/usr/local/lib

post-patch:
	@${REINPLACE_CMD} -e "s|/etc/|${PREFIX}/etc/|" \
		${WRKSRC}/src/graffer.[c8]
	@${REINPLACE_CMD} -e "s|/etc/|${PREFIX}/etc/|" \
		${WRKSRC}/etc/graffer.conf.example

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/graffer ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/src/graffer.8 ${STAGEDIR}${PREFIX}/share/man/man8
	@${MKDIR} ${STAGEDIR}${PREFIX}/etc/graffer
	${INSTALL_DATA} ${WRKSRC}/etc/graffer.conf.example ${STAGEDIR}${PREFIX}/etc/graffer
	@${MKDIR} ${STAGEDIR}${PREFIX}/etc/graffer/conf.d.example
	cd ${WRKSRC}/etc/conf.d && ${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/etc/graffer/conf.d.example

.include <bsd.port.mk>
