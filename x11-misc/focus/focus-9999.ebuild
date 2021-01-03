# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/phillbush/focus.git"
fi

inherit toolchain-funcs ${SCM}

DESCRIPTION="Focus the closest window in a given direction"
HOMEPAGE="https://github.com/phillbush/focus"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/phillbush/focus/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	x11-libs/libX11
	x11-libs/libXinerama
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README )

src_prepare() {
	default

	sed -e '/^CPPFLAGS/d' \
		-e 's/^CFLAGS =/CFLAGS +=/g' \
		-e 's/^LDFLAGS =/LDFLAGS +=/g' \
		-i config.mk || die
}

src_compile() {
	emake \
		CC="$(tc-getCC)"
}

src_install() {
	emake install \
		DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr"
	einstalldocs
}
