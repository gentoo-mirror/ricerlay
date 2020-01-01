# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A featherweight, lemon-scented, bar based on xcb"
HOMEPAGE="https://github.com/LemonBoy/bar"
SRC_URI="https://github.com/LemonBoy/bar/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+xft"

DEPEND="x11-libs/libxcb
	xft? ( x11-libs/libXft )
"
RDEPEND="${DEPEND}
	dev-lang/perl
"

S="${WORKDIR}/bar-${PV}"
