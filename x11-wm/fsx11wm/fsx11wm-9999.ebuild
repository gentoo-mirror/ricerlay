# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/Xeno-Hypster/fsx11wm.git"
fi

inherit toolchain-funcs ${SCM}

DESCRIPTION="Full screen window manager in less then 100 lines of C"
HOMEPAGE="https://github.com/Xeno-Hypster/fsx11wm"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/Xeno-Hypster/fsx11wm/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=(README)

src_prepare() {
	sed -e 's/ -O3//' -i Makefile || die

	default
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake install \
		DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr"

	einstalldocs
}
