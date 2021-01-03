# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/sdushantha/kunst.git"
fi

inherit eutils ${SCM}

DESCRIPTION="Download and display album art or display embedded album art"
HOMEPAGE="https://github.com/sdushantha/kunst"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/sdushantha/kunst/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	|| ( media-gfx/sxiv media-gfx/imv )
	app-misc/jq
	app-shells/bash
	media-sound/mpc
	media-sound/mpd
	media-video/ffmpeg
"
BDEPEND=""

src_install() {
	dobin ${PN}
}
