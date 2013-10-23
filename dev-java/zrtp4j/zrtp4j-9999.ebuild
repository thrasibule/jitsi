# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 git-r3

DESCRIPTION=""
HOMEPAGE=""
EGIT_REPO_URI="http://github.com/wernerd/ZRTP4J.git"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEP}"

JAVA_ANT_REWRITE_CLASSPATH="yes"
EANT_BUILD_TARGET=""
EANT_DOC_TARGET=""
EANT_GENTOO_CLASSPATH="bcprov,bccontrib,fmj,junit"

java_prepare() {
	find . -name '*.jar' -print -delete ||die
}

src_install() {
	java-pkg_newjar "dist/${PN}-3.2.0.jar" "${PN}.jar"
	use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc src
}
