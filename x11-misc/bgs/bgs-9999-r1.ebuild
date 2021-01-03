# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/Gottox/bgs.git"
fi

inherit toolchain-funcs ${SCM}

DESCRIPTION="Simple background setter based on imlib2"
HOMEPAGE="https://github.com/Gottox/bgs"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/Gottox/bgs/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="xinerama"

DEPEND="
	xinerama? ( x11-libs/libXinerama )
	media-libs/imlib2
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	sed	-e "s/^CC.*/CC = $(tc-getCC)/" \
		-i config.mk || die

	if ! use xinerama; then
		sed -e '/XINERAMALIBS =/d' \
			-e '/XINERAMAFLAGS =/d' \
			-i config.mk || die
	fi

	default
}

src_install() {
	dobin ${PN}
	doman ${PN}.1
	dodoc README
}
