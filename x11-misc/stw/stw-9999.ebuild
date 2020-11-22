# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/sineemore/stw.git"
fi

inherit toolchain-funcs savedconfig "${SCM}"

DESCRIPTION="Simple text widget for X"
HOMEPAGE="https://github.com/sineemore/stw"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/sineemore/stw/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXft
	x11-libs/libXrender
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

src_prepare() {
	default

	sed -e 's/\ =/\ +=/g' -i Makefile || die
}

src_compile() {
	restore_config config.h

	emake \
		CC="$(tc-getCC)"
}

src_install() {
	save_config config.h

	dobin ${PN}
	doman ${PN}.1
	einstalldocs
}
