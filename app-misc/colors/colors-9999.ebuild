# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="extract colors from pictures"
HOMEPAGE="http://git.2f30.org/colors"
EGIT_REPO_URI="git://git.2f30.org/colors.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-libs/libpng"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install () {
	dobin ${PN}
	doman ${PN}.1
}
