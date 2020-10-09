# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/comfies/custard.git"
fi

DESCRIPTION="Manual tiling window manager"
HOMEPAGE="https://github.com/comfies/custard"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/comfies/custard/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	dev-libs/libpcre
	x11-libs/xcb-util
	x11-libs/xcb-util-wm
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake install DESTDIR="${D}" PREFIX="/usr"
	newman man/custard.man ${PN}.1
}
