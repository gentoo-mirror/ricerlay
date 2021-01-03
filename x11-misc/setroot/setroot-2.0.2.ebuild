# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ttzhou/setroot.git"
fi

DESCRIPTION="simple X background setter inspired by imlibsetroot and feh"
HOMEPAGE="https://github.com/ttzhou/setroot"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/ttzhou/setroot/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="xinerama"

DEPEND="media-libs/imlib2
	x11-libs/libX11
	xinerama? ( x11-libs/libXinerama )
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.asciidoc )

src_compile() {
	emake xinerama=$(usex xinerama 1 0)
}

src_install() {
	einstalldocs
	emake DESTDIR="${D}" PREFIX="/usr" install
}
