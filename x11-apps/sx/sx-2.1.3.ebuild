# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Earnestly/sx.git"
fi

DESCRIPTION="A simpler alternative to xinit"
HOMEPAGE="https://github.com/Earnestly/sx"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/Earnestly/sx/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	x11-apps/xauth
	x11-base/xorg-server[xorg]
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile()
{
	true
}

src_install()
{
	dobin ${PN}
	doman ${PN}.1
}
