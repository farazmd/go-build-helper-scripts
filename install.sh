#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

PROJECTPATH=$(pwd) &&
	DOWNLOADPATH="${XDG_CONFIG_HOME:-/tmp}/go-build-helper-scripts" &&
	git clone -b master https://github.com/farazmd/go-build-helper-scripts.git "${DOWNLOADPATH}" &&
	mv -f ${DOWNLOADPATH}/build ${PROJECTPATH} &&
	mv -f ${DOWNLOADPATH}/Makefile ${PROJECTPATH} &&
	mv -f ${DOWNLOADPATH}/default.golangci.yml ${PROJECTPATH}/.golangci.yml &&
	rm -rf ${DOWNLOADPATH} &&
	echo "Install successful!!"
