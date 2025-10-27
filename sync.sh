#!/bin/sh

###
RAWURL=https://raw.githubusercontent.com/freebsd/freebsd-ports/refs/heads/main/
FILES="
	Mk/bsd.port.mk
	Mk/bsd.licenses.mk
	Mk/bsd.sites.mk
	Mk/bsd.ccache.mk
	Mk/bsd.sanity.mk
	Mk/bsd.options.mk
	Mk/bsd.default-versions.mk
	Mk/bsd.commands.mk
	Mk/bsd.licenses.db.mk
	Mk/Features/ssp.mk
	Mk/Uses/gmake.mk
	Mk/Uses/tar.mk
	Mk/Scripts/check-vulnerable.sh
	Mk/Scripts/do-depends.sh
	Mk/Scripts/functions.sh
	Mk/Scripts/do-fetch.sh
	Mk/Scripts/checksum.sh
	Mk/Scripts/makesum.sh
	Mk/Scripts/do-patch.sh
	Templates/BSD.local.dist
"
###
myfetch() {
	fetch -o ${1} ${RAWURL}/${1}
}

for F in ${FILES}
do
	mkdir -p `dirname ${F}`
	myfetch ${F}
done
