# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 git-r3

DESCRIPTION=""
HOMEPAGE=""
EGIT_REPO_URI="http://github.com/kirillcool/trident.git"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"

IUSE=""

COMMON_DEP="dev-java/swt:3.7"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEP}"

JAVA_ANT_REWRITE_CLASSPATH="yes"
EANT_BUILD_TARGET="all"
EANT_DOC_TARGET=""
EANT_GENTOO_CLASSPATH="swt-3.7"

java_prepare() {
	find . -name '*.jar' -print -delete ||die
	sed -i -e "s|jdk\.home.*$|jdk\.home=$(java-config -O)|" build.properties ||die
	rm -rf ./src/org/pushingpixels/trident/android ||die
}

src_install() {
	java-pkg_dojar "drop/${PN}.jar"
}
