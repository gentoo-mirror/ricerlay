# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Streaming bar graphs. For stats and stuff."
HOMEPAGE="https://github.com/seenaburns/stag"
SRC_URI="https://github.com/seenaburns/stag/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-ncurses.patch"
)

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
