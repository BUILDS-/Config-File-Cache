# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="basic utilities for queueing to a Gutenbach music server"
HOMEPAGE="http://gutenbach.mit.edu"
SRC_URI="http://boogeyman.armory.com/~fiveandthreequarters/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="<dev-lang/perl-6
	media-libs/exiftool
	dev-perl/Net-CUPS"

src_install() {
	dobin bin/gbr
	dobin bin/gbrm
	dobin bin/gbq
	dobin bin/gutenbach-client-config
	doman bin/gbr.1
	doman bin/gbrm.1
	doman bin/gbq.1
	doman bin/gutenbach-client-config.1
}
