# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="History.txt README.txt ReleaseNotes"

inherit ruby-fakegem

DESCRIPTION="console-based email client for people with a lot of mails"
HOMEPAGE="http://sup.rubyforge.org/"
SRC_URI="mirror://rubyforge/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-libs/xapian-bindings[ruby]"

ruby_add_rdepend "dev-ruby/highline
	dev-ruby/ncurses-ruby
	dev-ruby/ncursesw-ruby
	dev-ruby/net-ssh
	dev-ruby/trollop
	dev-ruby/mime-types
	dev-ruby/ruby-gettext
	dev-ruby/rubymail
	dev-ruby/fastthread
	dev-ruby/lockfile"  # <- not in portage


