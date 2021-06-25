# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/13-CF/afetch.git"
fi

inherit savedconfig toolchain-funcs ${SCM}

DESCRIPTION="Simple system info written in C"
HOMEPAGE="https://github.com/13-CF/afetch"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/13-CF/afetch/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=(README.md)

src_prepare() {
	sed -e 's/^CFLAGS =/CFLAGS +=/' \
		-e 's/-O2//g' \
		-i Makefile || die

	restore_config src/config.h

	default
}

src_compile() {
	emake \
		CC="$(tc-getCC)"
}

src_install() {
	save_config src/config.h

	dobin ${PN}
	doman src/${PN}.1
}
