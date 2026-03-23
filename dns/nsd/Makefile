PORTNAME=	nsd
DISTVERSION=	7.8.20260322
CATEGORIES=	dns

MAINTAINER=	koue@chaosophia.net
COMMENT=	Authoritative only non-recursive name server
WWW=		https://github.com/koue/nsd

USE_GITHUB=	yes
GH_ACCOUNT=	koue
GH_PROJECT=	nsd

USE_RC_SUBR=	nsd

#NSDGROUP?=	nsd
#NSDLSDIR=	/var
#NSDRUNDIR=	/var/run/nsd

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--localstatedir=/var \
		--with-configdir=${ETCDIR} \
		--with-pidfile=/var/run/nsd.pid \
		--with-ssl=${OPENSSLBASE} \
		--with-user=nsd \
		--with-dbfile="" \
		--with-libevent=no \
		--disable-dnstap

USERS=		nsd
GROUPS=		nsd

WRKSRC_SUBDIR=	src/usr.sbin/nsd

pre-configure:
	@(cd ${WRKSRC} && chmod +x configure && chmod +x install-sh)

.include <bsd.port.mk>
