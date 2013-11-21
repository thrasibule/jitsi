# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 subversion

DESCRIPTION="Java MSN Messenger library"
HOMEPAGE="http://sourceforge.net/apps/trac/java-jml/"
ESVN_REPO_URI="http://svn.code.sf.net/p/java-jml/code/trunk"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""

IUSE=""

COMMON_DEP="dev-java/commons-logging:0
	dev-java/httpcomponents-core:0"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEP}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_TARGET=""
EANT_BUILD_XML="build/build.xml"
EANT_DOC_TARGET="javadoc"
EANT_GENTOO_CLASSPATH="httpcomponents-core,commons-logging"

src_prepare() {
	default
	find . -name '*.jar' -delete|| die
}

src_install() {
	java-pkg_newjar "dist/${PN}-1.0b5.jar" "${PN}.jar"
}
