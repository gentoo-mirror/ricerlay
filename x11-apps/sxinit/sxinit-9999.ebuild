# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/sineemore/sxinit.git"
fi

inherit toolchain-funcs "${SCM}"

DESCRIPTION="Simple xinit alternative"
HOMEPAGE="https://github.com/sineemore/sxinit"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/sineemore/sxinit/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	x11-base/xorg-server[xorg]
"
BDEPEND=""

src_prepare() {
	default

	sed -e 's/ =/ ?=/g' -i Makefile || die
}

src_compile() {
	emake \
		CC="$(tc-getCC)"
}

src_install() {
	dobin ${PN}
}
