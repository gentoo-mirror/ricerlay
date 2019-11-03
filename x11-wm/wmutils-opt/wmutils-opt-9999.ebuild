# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/wmutils/opt"
fi

inherit ${SCM}

DESCRIPTION="Set of window manipulation tools"
HOMEPAGE="https://github.com/wmutils/opt"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/wmutils/opt/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="ISC"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libxcb"
RDEPEND="${DEPEND}"
BDEPEND=""

if [[ ${PV} != *9999 ]]; then
	S="${WORKDIR}/opt-${PV}"
fi
