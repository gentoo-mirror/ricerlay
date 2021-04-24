# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/salman-abedin/devour.git"
fi

inherit toolchain-funcs ${SCM}

DESCRIPTION="Window manager agnostic swallowing feature for terminal emulators"
HOMEPAGE="https://github.com/salman-abedin/devour"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/salman-abedin/devour/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=(README.md)

src_prepare() {
	default

	sed -e 's/^CFLAGS =/CFLAGS +=/' \
		-e 's/ -s //g' \
		-e 's/ -O2//g' \
		-i Makefile || die
}

src_compile() {
	emake \
		CC="$(tc-getCC)"
}

src_install() {
	dobin ${PN}
	einstalldocs
}
