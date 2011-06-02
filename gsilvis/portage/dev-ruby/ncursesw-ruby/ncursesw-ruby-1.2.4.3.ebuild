# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="Changes README THANKS TODO"
RUBY_FAKEGEM_NAME="ncursesw"

inherit multilib ruby-fakegem

DESCRIPTION="Ruby wrapper for ncurses providing wide character support."
HOMEPAGE="https://github.com/rlane/ncursesw-ruby"
SRC_URI="http://gems.rubyforge.org/gems/ncursesw-${PV}.gem"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"
IUSE="examples"

DEPEND=">=sys-libs/ncurses-5.3"
RDEPEND="${DEPEND}"

RUBY_PATCHES=( "${FILESDIR}"/${P}-fix-trace.patch )

each_ruby_configure() {
	${RUBY} extconf.rb || die
}

each_ruby_compile() {
	emake || die
	mv ncursesw_bin$(get_modname) lib/ || die
}

all_ruby_install() {
	all_fakegem_install
	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples || die
	fi
}

