#!/bin/sh

REPOPATH=/var/www/htdocs/pkg.chaosophia.net

for path in $(find . -type d -name pkg); do
	cp -v ${path}/* ${REPOPATH}/
done

pkg repo ${REPOPATH}/
cp index.html ${REPOPATH}/
cp distfiles/* ${REPOPATH}/distfiles/
