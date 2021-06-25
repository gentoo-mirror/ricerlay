# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/dylanaraps/sowm.git"
fi

inherit savedconfig ${SCM}

DESCRIPTION="An itsy bitsy floating window manager"
HOMEPAGE="https://github.com/dylanaraps/sowm"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/dylanaraps/sowm/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=(README.md)

src_compile() {
	restore_config config.h
	default
}

src_install() {
	save_config config.h
	default
}
