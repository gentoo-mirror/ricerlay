# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cbdevnet/xecho.git"
fi

DESCRIPTION="Render text messages to the screen with minimal dependencies"
HOMEPAGE="https://github.com/cbdevnet/xecho"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/cbdevnet/xecho/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="WTFPL-2"
SLOT="0"
IUSE=""

DEPEND="
	media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXft
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

DOCS=( README.txt )

src_configure() {
	sed -e 's/^all:.*/all: xecho/' -i Makefile || die
	sed -e '/DOCDIR/d' -i Makefile || die
}

src_install() {
	default
	doman man/man1/xecho.1
}
