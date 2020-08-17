# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wmutils/opt.git"
fi

DESCRIPTION="Optional addons to wmutils"
HOMEPAGE="https://github.com/wmutils/opt"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/wmutils/opt/archive/v${PV}.tar.gz -> ${P}.tar.gz"
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

if [[ ${PV} != *9999 ]]; then
	S="${WORKDIR}/opt-${PV}"
fi

DOCS=( README.md )

src_prepare() {
	default
	sed -e 's/-Os//g' -i config.mk || die
}
