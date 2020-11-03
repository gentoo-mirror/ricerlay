# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/florentc/xob.git"
fi

DESCRIPTION="A lightweight overlay volume (or anything) bar"
HOMEPAGE="https://github.com/florentc/xob"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/florentc/xob/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	dev-libs/libconfig
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

DOCS=( README.md )

src_install()
{
	emake install \
		DESTDIR="${D}" \
		prefix="${EPREFIX}/usr" \
		sysconfdir="${EPREFIX}/etc"
	einstalldocs
}
