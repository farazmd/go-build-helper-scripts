#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

PROJECTPATH=$(pwd) &&
	DOWNLOADPATH=${XDG_CONFIG_HOME:-/tmp} &&
	git clone -b develop https://github.com/farazmd/go-build-helper-scripts.git ${DOWNLOADPATH} &&
	mv -f ${DOWNLOADPATH}/build ${PROJECTPATH} &&
	mv -f ${DOWNLOADPATH}/Makefile ${PROJECTPATH} &&
	mv -f ${DOWNLOADPATH}/default.golangci.yml ${PROJECTPATH}/.golangci.yml &&
	rm -rf ${DOWNLOADPATH}/go-build-helper-scripts &&
	echo "Install successful!!"
