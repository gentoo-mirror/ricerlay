# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/mcpcpc/xwm.git"
fi

inherit toolchain-funcs ${SCM}

DESCRIPTION="A tiny XCB floating window manager"
HOMEPAGE="https://github.com/mcpcpc/xwm"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/mcpcpc/xwm/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	x11-libs/libxcb
	x11-libs/xcb-util-keysyms
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README )

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	einstalldocs
}
