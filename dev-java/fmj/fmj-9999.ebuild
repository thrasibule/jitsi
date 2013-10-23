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

EANT_BUILD_TARGET="jar-jitsi"

java_prepare() {
	find . -name *.jar -delete|| die
	pushd lib
	java-pkg_jar-from commons-math-3 commons-math.jar commons-math3-3.2.jar
	java-pkg_jar-from jchart2d jchart2d.jar jchart2d-3.2.2.jar
	popd
}

src_install() {
	java-pkg_dojar "build/jars/${PN}.jar"
}
