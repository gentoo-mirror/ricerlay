# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/venam/2bwm.git"
fi

inherit savedconfig ${SCM}

DESCRIPTION="A fast floating WM written over the XCB library and derived from mcwm"
HOMEPAGE="https://github.com/venam/2bwm"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/venam/2bwm/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="ISC"
SLOT="0"
IUSE=""

DEPEND="
	x11-libs/xcb-util
	x11-libs/xcb-util-renderutil
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-xrm
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

src_prepare() {
	sed -e 's/-Os -s//g' -i Makefile || die
	default
}

src_compile() {
	restore_config config.h
	default
}

src_install() {
	save_config config.h
	emake DESTDIR="${D}" PREFIX=/usr install
	einstalldocs
}
