# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/z411/vrms-gentoo.git"
fi

DESCRIPTION="Virtual Richard M. Stallman"
HOMEPAGE="https://github.com/z411/vrms-gentoo"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/z411/vrms-gentoo/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ${PN}
	dodoc README.md
}
