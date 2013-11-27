# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 subversion

DESCRIPTION="An alternative to Java Media Framework"
HOMEPAGE="http://fmj-sf.net/"
ESVN_REPO_URI="http://svn.code.sf.net/p/fmj/code/fmj"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS=""

IUSE=""

RDEPEND=">=virtual/jre-1.5"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_TARGET="jar-jitsi"

src_prepare() {
	default
	find . -name *.jar -print -delete|| die
}

src_install() {
	java-pkg_dojar "build/jars/${PN}.jar"
}

src_test() {
	eant build-test
}
