# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3

DESCRIPTION="i3 with more features"
HOMEPAGE="https://github.com/Airblader/i3"
EGIT_REPO_URI="https://github.com/Airblader/i3.git"
EGIT_BRANCH="gaps-next"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/libev
	dev-libs/libpcre
	>=dev-libs/yajl-2.0.3
	virtual/pkgconfig
	>=x11-libs/cairo-1.14.4[X,xcb]
	x11-libs/libxcb[xkb]
	x11-libs/libxkbcommon[X]
	>=x11-libs/pango-1.30.0[X]
	x11-libs/startup-notification
	x11-libs/xcb-util
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	x11-libs/xcb-util-xrm
"
RDEPEND="${DEPEND}
	dev-lang/perl
	dev-perl/AnyEvent-I3
	dev-perl/JSON-XS
	!x11-wm/i3
"

BUILDDIR="${S}/build"

src_prepare() {
	default

	eautoreconf

	sed -i 's/-non-git//' I3_VERSION

	if has nodoc ${FEATURES}; then
		sed -e 's/\(AM_CONDITIONAL(\[BUILD_DOCS\],\).*/\1 false)/' \
			-i configure.ac || die
	fi
	if has noman ${FEATURES}; then
		sed -e 's/\(AM_CONDITIONAL(\[BUILD_MANS\],\).*/\1 false)/' \
			-i configure.ac || die
	fi

	cat <<- EOF > "${T}"/i3wm
		#!/bin/sh
		exec /usr/bin/i3
	EOF
}

src_configure() {
	mkdir "${BUILDDIR}"
	cd "${BUILDDIR}" || die
	../configure
}

src_compile() {
	cd "${BUILDDIR}" || die
	emake V=1
}

src_install() {
	cd "${BUILDDIR}" || die
	emake DESTDIR="${D}" install

	exeinto /etc/X11/Sessions
	doexe "${T}"/i3wm
}
