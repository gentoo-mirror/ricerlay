# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit linux-info eutils autotools

DESCRIPTION="A Console-based audio visualizer"
HOMEPAGE="https://github.com/karlstav/cava"
SRC_URI="https://github.com/karlstav/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

DEPEND="dev-libs/iniparser:=
	media-libs/alsa-lib
	sci-libs/fftw:=
	sys-libs/ncurses:=
"
RDEPEND="${DEPEND}"

DOCS="README.md"

pkg_setup() {
		if linux_config_exists; then
			einfo "Checking kernel configuration at $(linux_config_path)..."
			if ! linux_chkconfig_present SND_ALOOP; then
				ewarn 'Kernel option CONFIG_SND_ALOOP=[ym] needed but missing'
			fi
		fi
}

src_prepare() {
	eapply_user

	eautoreconf
}

src_configure() {
	econf $(use_enable debug ) \
		--enable-legacy_iniparser \
		--docdir="${EREFIX}"/usr/share/doc/${PF}
}

src_compile() {
	emake SYSTEM_LIBINIPARSER=1 VERSION=${PV}
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr SYSTEM_LIBINIPARSER=1 install

	einstalldocs
}
