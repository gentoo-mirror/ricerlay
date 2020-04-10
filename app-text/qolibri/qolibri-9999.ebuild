# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	SCM="git-r3"
	EGIT_REPO_URI="https://github.com/ludios/qolibri.git"
fi

inherit cmake-utils ${SCM}

DESCRIPTION="Continuation of the qolibri EPWING dictionary/book reader"
HOMEPAGE="https://github.com/ludios/qolibri"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/ludios/qolibri/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="dev-libs/eb
	dev-qt/linguist-tools:5[qml]
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5[qml]
	dev-qt/qtnetwork:5
	dev-qt/qtwebchannel:5[qml]
	dev-qt/qtwebengine:5[widgets]
	sys-libs/zlib"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"
