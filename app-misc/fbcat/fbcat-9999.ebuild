# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jwilk/fbcat.git"
fi

DESCRIPTION="Framebuffer grabber"
HOMEPAGE="https://github.com/jwilk/fbcat"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/jwilk/fbcat/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="doc"

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/netpbm
	sys-apps/kbd
"
BDEPEND="
	doc? (
		app-text/docbook-xsl-stylesheets
		dev-libs/libxslt
	)
"

src_compile() {
	default

	if use doc; then
		emake -C doc
	fi
}

src_install() {
	emake install \
		DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr"
}
