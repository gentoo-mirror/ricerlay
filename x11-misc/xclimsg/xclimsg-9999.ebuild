# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/phillbush/xclimsg.git"
fi

inherit toolchain-funcs ${SCM}

DESCRIPTION="Hybrid (floating and tiling) window manager"
HOMEPAGE="https://github.com/phillbush/xclimsg"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/phillbush/xclimsg/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=(README)

src_compile() {
	$(tc-getCC) -o ${PN} ${PN}.c -lX11
}

src_install() {
	dobin ${PN}
	einstalldocs
}
