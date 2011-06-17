# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION=""
HOMEPAGE="http://www.ats-lang.org/"
SRC_URI="x86? ( mirror://sourceforge/ats-lang/ats-lang-anairiats-${PV}-linux-x86-32.tar.gz )
	amd64? ( mirror://sourceforge/ats-lang/ats-lang-anairiats-${PV}-linux-x86-64.tar.gz )"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 -*"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/gmp"

S="${WORKDIR}"

src_install() {
	dodir /usr/share/atshome
	dodir /usr/bin
	ewarn "Copying ${S}/usr to ${D} ..."
	cp -R "${S}/usr" "${D}" || die "Install failed!"
	cat > ${T}/95ats <<-EOF
ATSHOME="${EPREFIX}/usr/share/atshome"
ATSRELOC="ATS-${PV}"
EOF
	doenvd "${T}/95ats" || die "env.d failed!"
}

pkg_postinst() {
	elog "ATS/Anairiats depends on two environment variables, ATSHOME and"
	elog "ATSHOMERELOC. For atscc and atsopt to work, you must first run"
	elog "env-update. Any users logged in must log out and back in again"
	elog "if they wish to use atscc or atsopt."
}
