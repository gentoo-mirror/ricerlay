# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Clock using lib ncurses"
HOMEPAGE="https://github.com/xorg62/tty-clock"
SRC_URI="https://github.com/xorg62/${PN}/archive/v${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS="README"

src_install() {
	einstalldocs
	emake DESTDIR="${D}" PREFIX="/usr" install
}
