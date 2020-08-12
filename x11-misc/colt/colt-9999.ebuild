# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/azahi/colt.git"
fi

DESCRIPTION="A small color temperature and brightness controller for X11."
HOMEPAGE="https://github.com/azahi/colt"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/azahi/colt/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="WTFPL-2"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libX11
	x11-libs/libXinerama
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install ()
{
	dobin ${PN}
}
