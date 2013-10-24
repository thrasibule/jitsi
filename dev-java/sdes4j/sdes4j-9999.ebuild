# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 subversion

DESCRIPTION=""
HOMEPAGE=""
ESVN_REPO_URI="http://sdes4j.googlecode.com/svn/trunk"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"

IUSE=""

COMMON_DEP="dev-java/commons-codec:0"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEP}"

EANT_BUILD_TARGET=""
EANT_DOC_TARGET=""
EANT_GENTOO_CLASSPATH="commons-codec"

src_prepare() {
	default
	find -name '*.jar' -print -delete
	cp "${FILESDIR}/build.xml" .
}

src_install() {
	java-pkg_dojar "dist/lib/${PN}.jar"
	use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc src
}
