# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig

DESCRIPTION="Daemon-less notifications without D-Bus. Minimal and lightweight."
HOMEPAGE="https://github.com/dudik/herbe"
SRC_URI="https://github.com/dudik/herbe/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/libX11
	x11-libs/libXft
	media-libs/freetype:2
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default

	restore_config config.h
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	save_config config.h
}
