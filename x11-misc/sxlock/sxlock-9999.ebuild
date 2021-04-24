# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/lahwaacz/sxlock.git"
fi

DESCRIPTION="Simple X screen locker"
HOMEPAGE="https://github.com/lahwaacz/sxlock"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/lahwaacz/sxlock/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	sys-libs/pam
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXrandr
"
RDEPEND="${DEPEND}"
BDEPEND=""
