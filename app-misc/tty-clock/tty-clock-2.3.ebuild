# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/xorg62/tty-clock.git"
fi

DESCRIPTION="Clock using lib ncurses"
HOMEPAGE="https://github.com/xorg62/tty-clock"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/xorg62/tty-clock/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

DOCS=(
	README
)

src_install() {
	emake install \
		DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr"

	einstalldocs
}
