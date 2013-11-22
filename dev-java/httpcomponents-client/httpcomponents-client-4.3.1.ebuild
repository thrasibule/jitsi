# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/httpcomponents-core/httpcomponents-core-4.2.4.ebuild,v 1.1 2013/07/13 13:38:27 tomwij Exp $

EAPI="5"

JAVA_PKG_IUSE="source examples"

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="A low level toolset of Java components focused on HTTP and associated protocols."
HOMEPAGE="http://hc.apache.org/index.html"
SRC_URI="mirror://apache/${PN/-//http}/source/${P}-src.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

COMMON_DEPEND="dev-java/commons-logging:0
	dev-java/httpcomponents-core:4"

DEPEND="${COMMON_DEPEND}
	>=virtual/jdk-1.5"
RDEPEND="${COMMON_DEPEND}
	>=virtual/jre-1.5"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_TARGET=""
EANT_GENTOO_CLASSPATH="commons-logging,httpcomponents-core"

java_prepare() {
	cp "${FILESDIR}"/build.xml build.xml || die
}

src_install() {
	for mod in httpcore httpcore-nio ; do
		java-pkg_newjar ${mod}/target/${mod}-${PV}.jar ${mod}.jar
	done

	use source && java-pkg_dosrc httpcore{,-nio}/src/main/java
	use examples && java-pkg_doexamples httpcore{,-nio}/src/examples

	dodoc {README,RELEASE_NOTES,NOTICE}.txt
}
