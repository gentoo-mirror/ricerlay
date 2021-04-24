# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://www.uninformativ.de/git/xlocatemouse.git"
fi

inherit toolchain-funcs ${SCM}

DESCRIPTION="Find your X11 mouse pointer"
HOMEPAGE="https://www.uninformativ.de/git/xlocatemouse/file/README.html"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://www.uninformativ.de/git/xlocatemouse/archives/xlocatemouse-v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN}-v${PV}"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

DOCS=(CHANGES)

src_prepare() {
	default

	sed -e 's/-O2 //g' -i Makefile || die
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake install \
		DESTDIR="${D}" \
		prefix="${EPREFIX}/usr"

	einstalldocs
}
