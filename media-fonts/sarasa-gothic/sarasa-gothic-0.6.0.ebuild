# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="A CJK programming font based on Iosevka and Source Han Sans"
HOMEPAGE="https://github.com/be5invis/${PN}"
SRC_URI="https://github.com/be5invis/${PN}/releases/download/v${PV/_/-}/"
SRC_URI="ttc? ( ${SRC_URI}${PN}-ttc-${PV%_*}.7z )
	ttf? ( ${SRC_URI}${PN}-ttf-${PV%_*}.7z )
"
RESTRICT="primaryuri"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE_FONT_TYPES=( ttc +ttf )
IUSE_FONT_VARIANTS=( gothic +mono term ui )
IUSE_L10N=( ja ko zh-CN zh-TW )
IUSE="${IUSE_L10N[@]/#/l10n_} ${IUSE_FONT_TYPES[@]} ${IUSE_FONT_VARIANTS[@]}"
REQUIRED_USE="|| ( l10n_ja l10n_ko l10n_zh-CN l10n_zh-TW )
	?? ( ${IUSE_FONT_TYPES[@]/#+/} )
"

DEPEND="app-arch/p7zip"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_prepare() {
	default

	use ttc && return

	rm -f \
		$(usex !l10n_ja "${PN%-*}*-j-*.ttf") \
		$(usex !l10n_ko "${PN%-*}*-cl-*.ttf") \
		$(usex !l10n_zh-CN "${PN%-*}*-sc-*.ttf") \
		$(usex !l10n_zh-TW "${PN%-*}*-tc-*.ttf")

	local i
	for i in "${IUSE_FONT_VARIANTS[@]/#+/}"; do
		use ${_v} || rm -f ${PN%-*}-${i}-*.ttf
	done
}
