# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/seenaburns/stag.git"
fi

inherit toolchain-funcs ${SCM}

DESCRIPTION="Streaming bar graphs for stats and stuff"
HOMEPAGE="https://github.com/seenaburns/stag"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/seenaburns/stag/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	sed -e 's/^CFLAGS=/CFLAGS+=/' \
		-e 's/-lncurses/-lncurses -ltinfo/' \
		-i Makefile || die

	default
}

src_compile() {
	emake \
		CC="$(tc-getCC)"
}

src_install() {
	emake install \
		DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr"
}
