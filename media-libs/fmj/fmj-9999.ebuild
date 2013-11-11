# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 git-r3

DESCRIPTION=""
HOMEPAGE=""
EGIT_REPO_URI="http://github.com/Metaswitch/fmj.git"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"

IUSE=""

COMMON_DEP="dev-java/jchart2d:0
	dev-java/commons-math:3"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEP}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_TARGET="jar-jitsi"
EANT_GENTOO_CLASSPATH="commons-math-3,jchart2d"

java_prepare() {
	find . -name *.jar -delete|| die
}

src_install() {
	java-pkg_dojar "build/jars/${PN}.jar"
}
