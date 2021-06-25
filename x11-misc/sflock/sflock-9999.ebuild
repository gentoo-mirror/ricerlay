# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/benruijl/sflock.git"
fi

inherit toolchain-funcs ${SCM}

DESCRIPTION="Simple X display locker, with basic user feedback"
HOMEPAGE="https://github.com/benruijl/sflock"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/benruijl/sflock/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	x11-libs/libX11
	x11-libs/libXext
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	sed -e "s/ -Os / ${CFLAGS} /" \
		-e "s/ -s / ${LDFLAGS} /" \
		-e "s/ cc/ $(tc-getCC)/" \
		-i config.mk || die

	default
}

src_install() {
	emake install DESTDIR="${D}" PREFIX="/usr"
}
