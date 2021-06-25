# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Useful bits and pieces for wmutils"
HOMEPAGE="https://github.com/wmutils/contrib"
EGIT_REPO_URI="https://github.com/wmutils/contrib.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="+deletelock +focus-watcher +killwa +switch-grid"

DEPEND="
	x11-wm/wmutils
	killwa? (
		x11-libs/libxcb
		x11-libs/xcb-util-wm
	)
"
RDEPEND="${DEPEND}
	deletelock? ( x11-apps/xprop )
	focus-watcher? ( x11-wm/wmutils-opt )
	switch-grid? ( x11-wm/wmutils-opt )
"
BDEPEND=""

DOCS=(README.md)

src_prepare() {
	default
	if use killwa; then
		local S="${S}/killwa"
		sed -e 's/-Os//g' -i "${S}/config.mk" || die
	fi
}

src_compile() {
	if use killwa; then
		local S="${S}/killwa"
		emake -C "${S}"
	fi
}

src_install() {
	dobin closest.sh
	dobin focus.sh
	dobin fullscreen.sh
	dobin groups.sh
	dobin rainbow.sh
	dobin snap.sh
	dobin tile.sh
	dobin underneath.sh
	dobin wmenu.sh
	dobin workspace.sh
	use focus-watcher && dobin focus_watcher.sh
	use switch-grid && dobin switch_grid.sh
	use deletelock && dobin deletelock.sh
	if use killwa; then
		local S="${S}/killwa"
		emake -C "${S}" DESTDIR="${D}" install
	fi
}
