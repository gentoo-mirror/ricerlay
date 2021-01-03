# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/glouw/paperview.git"
fi

inherit eutils ${SCM}

DESCRIPTION="focus the closest window in a given direction"
HOMEPAGE="https://github.com/glouw/paperview"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/glouw/paperview/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="media-libs/libsdl2
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ${PN}
}
