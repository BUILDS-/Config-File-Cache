# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="ruby library for creating NFS safe lockfiles"
HOMEPAGE="http://codeforpeople.com/lib/ruby/ 
	http://rubyforge.org/projects/codeforpeople/"
SRC_URI="http://codeforpeople.com/lib/ruby/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

