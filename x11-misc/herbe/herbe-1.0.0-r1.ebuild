# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/dudik/herbe.git"
fi

inherit savedconfig ${SCM}

DESCRIPTION="Daemon-less notifications without D-Bus"
HOMEPAGE="https://github.com/dudik/herbe"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/dudik/herbe/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	media-libs/freetype:2
	x11-libs/libX11
	x11-libs/libXft
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

src_prepare() {
	restore_config config.h
	default
}

src_install() {
	save_config config.h
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	einstalldocs
}
