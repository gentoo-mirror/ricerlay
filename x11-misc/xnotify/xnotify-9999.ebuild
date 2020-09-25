# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/phillbush/xnotify.git"
fi

DESCRIPTION="read notifications from stdin and display them on the screen"
HOMEPAGE="https://github.com/phillbush/xnotify"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/phillbush/xnotify/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	media-libs/fontconfig
	media-libs/imlib2
	x11-libs/libX11
	x11-libs/libXft
	x11-libs/libXinerama
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
