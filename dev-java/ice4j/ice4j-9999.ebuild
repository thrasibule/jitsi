# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 subversion

DESCRIPTION="A Java implementation of the ICE protocol"
HOMEPAGE="http://www.ice4j.org"
ESVN_REPO_URI="http://ice4j.googlecode.com/svn/trunk/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""

IUSE=""

COMMON_DEP="dev-java/xalan:0
	dev-java/junit:4
	dev-java/weupnp:0
	dev-java/jsip:0"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	dev-java/xalan
	${COMMON_DEP}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_TARGET=""
EANT_DOC_TARGET=""
EANT_GENTOO_CLASSPATH="xalan,weupnp,jsip,junit-4"

src_prepare() {
	default
	java-pkg-2_src_prepare
	find . -name *.jar -print -delete ||die
}

src_install() {
	java-pkg_dojar "${PN}.jar"
	use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc src
}
