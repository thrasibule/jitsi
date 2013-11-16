# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://www.dnsjava.org/download/${P}.zip"

LICENSE="BSD"
SLOT="2"
KEYWORDS="~x86"

IUSE=""

RDEPEND=">=virtual/jre-1.4"
DEPEND=">=virtual/jdk-1.4
	app-arch/unzip"

#TODO compile tests

java_prepare() {
	find . -name '*.jar' -print -delete ||die
}

src_install() {
	java-pkg_newjar "${P}.jar" "${PN}.jar"
}
