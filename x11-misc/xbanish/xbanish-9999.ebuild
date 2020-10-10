# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jcs/xbanish.git"
fi

DESCRIPTION="Banish the mouse cursor when typing, show it again when the mouse moves"
HOMEPAGE="https://github.com/jcs/xbanish"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/jcs/xbanish/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND="
	x11-libs/libX11
	x11-libs/libXfixes
	x11-libs/libXi
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

src_install() {
	dobin ${PN}
	doman ${PN}.1
	einstalldocs
}
