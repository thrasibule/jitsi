# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 git-r3

DESCRIPTION="A ZRTP implementation in Java"
HOMEPAGE=""
EGIT_REPO_URI="http://github.com/wernerd/ZRTP4J.git"

LICENSE="BSD GPL-2-with-linking-exception GPL-3"
SLOT="0"
KEYWORDS=""

IUSE=""

COMMON_DEP="dev-java/bcprov:0
	dev-java/bccontrib:0"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	dev-java/junit:0
	${COMMON_DEP}"

JAVA_ANT_REWRITE_CLASSPATH="yes"
EANT_GENTOO_CLASSPATH="bcprov,bccontrib,fmj,junit"

java_prepare() {
	find . -name '*.jar' -print -delete ||die
}

src_install() {
	java-pkg_newjar "dist/${PN}-3.2.0.jar" "${PN}.jar"
	use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc src
}
