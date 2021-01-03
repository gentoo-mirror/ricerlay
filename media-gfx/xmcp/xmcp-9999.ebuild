# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/0xbiel/xmcp.git"
fi

inherit toolchain-funcs ${SCM}

DESCRIPTION="Universal color picker"
HOMEPAGE="https://github.com/0xbiel/xmcp"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/0xbiel/xmcp/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

src_compile() {
	$(tc-getCC) -o ${PN} ${PN}.c -lX11 ${CFLAGS} ${LDFLAGS}
}

src_install() {
	dobin ${PN}
	dodoc README.md
}
