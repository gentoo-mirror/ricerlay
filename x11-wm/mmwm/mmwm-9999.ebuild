# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/kaugm/mmwm.git"
fi

inherit savedconfig ${SCM}

DESCRIPTION="Modern Minimalistic Window Manager"
HOMEPAGE="https://github.com/kaugm/mmwm"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/kaugm/mmwm/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="ISC"
SLOT="0"
IUSE=""

DEPEND="
	x11-libs/libxcb
	x11-libs/xcb-util
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

src_compile() {
	restore_config config.h
	default
}

src_install() {
	save_config config.h
	emake DESTDIR="${D}" PREFIX=/usr install
	einstalldocs
}
