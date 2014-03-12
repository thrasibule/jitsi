# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 git-r3

DESCRIPTION="Skein/Threefish/Fortuna implementations for ZRTP4J"
HOMEPAGE="http://github.com/jitsi/bccontrib"
EGIT_REPO_URI="http://github.com/jitsi/bccontrib.git"

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="~x86"

IUSE=""

RDEPEND=">=virtual/jre-1.5"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_GENTOO_CLASSPATH="bcprov,junit-4"

java_prepare() {
	find . -name '*.jar' -print -delete ||die
	cp "${FILESDIR}"/build.xml .
}

src_install() {
	java-pkg_dojar "dist/lib/${PN}.jar"
	use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc src
}
