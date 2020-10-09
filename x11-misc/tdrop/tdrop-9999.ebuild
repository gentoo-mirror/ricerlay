# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/noctuid/tdrop.git"
fi

DESCRIPTION="A Glorified WM-Independent Dropdown Creator"
HOMEPAGE="https://github.com/noctuid/tdrop"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/noctuid/tdrop/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.org )

src_compile() {
	:;
}

src_install() {
	dobin ${PN}
	doman ${PN}.1
	einstalldocs
}
