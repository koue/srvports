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
	Mk/bsd.options.desc.mk
	Mk/Features/ssp.mk
	Mk/Uses/cpe.mk
	Mk/Uses/gmake.mk
	Mk/Uses/python.mk
	Mk/Uses/ssl.mk
	Mk/Uses/tar.mk
	Mk/Uses/uidfix.mk
	Mk/Scripts/check-vulnerable.sh
	Mk/Scripts/do-depends.sh
	Mk/Scripts/functions.sh
	Mk/Scripts/do-fetch.sh
	Mk/Scripts/checksum.sh
	Mk/Scripts/makesum.sh
	Mk/Scripts/do-patch.sh
	Mk/Scripts/depends-list.sh
	Mk/Scripts/check-stagedir.sh
	Mk/Scripts/plist_sub_sed_sort.sh
	Mk/Scripts/create-manifest.sh
	Mk/Scripts/actual-package-depends.sh
	Mk/Scripts/security-check.awk
	Mk/Scripts/find-lib.sh
	Mk/Scripts/do-users-groups.sh
	Mk/Scripts/smart_makepatch.sh
	Mk/Scripts/strip_RECORD.py
	Templates/BSD.local.dist
	Templates/config.guess
	Templates/config.sub
	Keywords/sample.ucl
	GIDs
	UIDs
"
###
myfetch() {
	mkdir -p `dirname ${1}`
	fetch -o ${1} ${RAWURL}/${1}
}

if [ ! -z "${1}" ]; then
	myfetch "${1}"
else
	for F in ${FILES}; do
		myfetch ${F}
	done
fi
