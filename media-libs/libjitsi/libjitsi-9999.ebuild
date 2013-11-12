# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 git-r3

DESCRIPTION=""
HOMEPAGE=""
EGIT_REPO_URI="http://github.com/jitsi/libjitsi.git"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86"

IUSE=""

COMMON_DEP="dev-java/bcprov:0
	dev-java/bccontrib:0
	dev-java/bcpkix:0
	dev-java/fmj:0
	dev-java/ice4j:0
	dev-java/jsip:0
	dev-java/json-simple:0
	dev-java/osgi-core-api:0
	dev-java/sdes4j:0
	dev-java/zrtp4j:0"

RDEPEND=">=virtual/jre-1.6
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.6
	app-arch/unzip
	${COMMON_DEP}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_TARGET="rebuild"
EANT_DOC_TARGET=""
EANT_GENTOO_CLASSPATH="bcprov,bccontrib,bcpkix,fmj,ice4j,jsip,json-simple,osgi-core-api,sdes4j,zrtp4j"

java_prepare() {
	find -name *.jar -print -delete
}

src_install() {
	java-pkg_dojar "${PN}.jar"
	use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc src
}
