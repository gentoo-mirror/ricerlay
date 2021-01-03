# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/karlstav/cava.git"
fi

inherit linux-info eutils autotools ${SCM}

DESCRIPTION="Console-based audio visualizer for ALSA"
HOMEPAGE="https://github.com/karlstav/cava"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/karlstav/cava/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="alsa debug portaudio pulseaudio system-iniparser"

DEPEND="
	sci-libs/fftw:3.0
	sys-libs/ncurses
	system-iniparser? ( dev-libs/iniparser:4 )
"
RDEPEND="${DEPEND}
	alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-sound/pulseaudio )
	portaudio? ( media-libs/portaudio )
"
BDEPEND=""

DOCS=( README.md example_files/ )

CONFIG_CHECK=(
	SND_ALOOP
)

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable alsa input-alsa) \
		$(use_enable pulseaudio input-pulse) \
		$(use_enable portaudio input-portaudio) \
		$(use_enable system-iniparser) \
		--docdir="${EREFIX}/usr/share/doc/${PF}"
}

src_compile() {
	emake
}

src_install() {
	einstalldocs
	emake DESTDIR="${D}" PREFIX=/usr install
}
