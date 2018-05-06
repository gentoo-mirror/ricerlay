# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit git-r3 cmake-utils python-single-r1

DESCRIPTION="A fast and easy-to-use status bar"
HOMEPAGE="https://github.com/jaagr/polybar"
EGIT_REPO_URI="https://github.com/jaagr/polybar.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="alsa curl i3 mpd network"

RDEPEND="x11-base/xcb-proto
	x11-libs/cairo[xcb]
	x11-libs/libxcb[xkb]
	x11-libs/xcb-util-image
	x11-libs/xcb-util-wm
	alsa? ( media-libs/alsa-lib )
	curl? ( net-misc/curl )
	i3? ( dev-libs/jsoncpp || ( x11-wm/i3 x11-wm/i3-gaps ) )
	mpd? ( media-libs/libmpdclient )
	network? ( net-wireless/wireless-tools )
"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2
		-DENABLE_ALSA="$(usex alsa)"
		-DENABLE_CURL="$(usex curl)"
		-DENABLE_I3="$(usex i3)"
		-DENABLE_MPD="$(usex mpd)"
		-DENABLE_NETWORK="$(usex network)"
	)

	cmake-utils_src_configure
}
