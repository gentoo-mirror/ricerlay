# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1 git-r3

DESCRIPTION="Jinja2 + YAML based config templater"
HOMEPAGE="https://github.com/metakirby5/zenbu"
EGIT_REPO_URI="https://github.com/metakirby5/zenbu.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DOCS=( README.rst LICENSE example )

DEPEND="dev-python/argcomplete[${PYTHON_USEDEP}]
	dev-python/colorlog[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]
	dev-python/watchdog[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"