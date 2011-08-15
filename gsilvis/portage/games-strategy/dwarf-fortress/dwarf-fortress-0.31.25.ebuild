# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit games

MY_P="df"
MY_PV="31_25"

DESCRIPTION="Overly complex single-player fantasy game with moody alcholic dwarves"
HOMEPAGE="http://www.bay12games.com/dwarves/"
SRC_URI="http://www.bay12games.com/dwarves/${MY_P}_${MY_PV}_linux.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="strip"

DEPEND=""
RDEPEND="app-emulation/emul-linux-x86-sdl
	app-emulation/emul-linux-x86-gtklibs"

S="${WORKDIR}/df_linux"

src_install() {
	local dir="${GAMES_PREFIX_OPT}/${PN}"

	insinto "${dir}"
	exeinto "${dir}/libs"

	doins -r data \
		g_src \
		raw \
		sdl \
		|| die

	doexe libs/* || die

	dodoc "command line.txt" \
		"file changes.txt" \
		"README.linux" \
		"readme.txt" \
		"release notes.txt" \
		|| die

	cp "${FILESDIR}/DwarfFortress" "${T}/DwarfFortress"
	echo "${dir}/libs/Dwarf_Fortress" >> "${T}/DwarfFortress"
	dogamesbin "${T}/DwarfFortress"

	echo "#!/bin/bash" >> "${T}"/DwarfFortress-setup
	echo "DFDIR=${dir}" >> "${T}"/DwarfFortress-setup
	cat "${FILESDIR}"/DwarfFortress-setup >>  "${T}"/DwarfFortress-setup
	dogamesbin "${T}/DwarfFortress-setup"

	prepgamesdirs
}
