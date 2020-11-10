# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/13-CF/afetch.git"
fi

inherit savedconfig ${SCM}

DESCRIPTION="Simple system info written in C"
HOMEPAGE="https://github.com/13-CF/afetch"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/13-CF/afetch/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	restore_config config.h
	default
}

src_install() {
	save_config config.h
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
