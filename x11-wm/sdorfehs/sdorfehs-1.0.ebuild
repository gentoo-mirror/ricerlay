# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/jcs/sdorfehs.git"
fi

inherit savedconfig ${SCM}

DESCRIPTION="Manual tiling window manager"
HOMEPAGE="https://github.com/jcs/sdorfehs"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/jcs/sdorfehs/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	x11-libs/libX11
	x11-libs/libXft
	x11-libs/libXrandr
	x11-libs/libXtst
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

src_compile() {
	restore_config config.h
	default
}

src_install() {
	save_config config.h
	dobin ${PN}
	doman ${PN}.1
}
