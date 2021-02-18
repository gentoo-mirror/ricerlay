# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/ierton/xkb-switch.git"
fi

inherit cmake multilib ${SCM}

DESCRIPTION="Switch your X keyboard layouts from the command line"
HOMEPAGE="https://github.com/ierton/xkb-switch"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/ierton/xkb-switch/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	x11-libs/libX11
	x11-libs/libxkbfile
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	sed -e "s/DESTINATION lib/DESTINATION $(get_libdir)/" \
		-i CMakeLists.txt

	cmake_src_prepare
	default
}
