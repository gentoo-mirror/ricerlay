# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/seenaburns/stag.git"
fi

DESCRIPTION="Streaming bar graphs. For stats and stuff."
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

PATCHES=(
	"${FILESDIR}/${P}-ncurses.patch"
)

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
