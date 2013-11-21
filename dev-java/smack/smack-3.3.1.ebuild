# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/smack/smack-2.2.1.ebuild,v 1.6 2012/06/07 21:21:09 ranger Exp $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

MY_PV="${PV//\./_}"
MY_P="${PN}_src_${MY_PV}"

DESCRIPTION="An Open Source XMPP (Jabber) client library for instant messaging and presence"
HOMEPAGE="http://www.igniterealtime.org/projects/smack/"
SRC_URI="http://www.igniterealtime.org/downloadServlet?filename=${PN}/${MY_P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="3.3"
KEYWORDS="~x86"
IUSE=""

COMMON_DEP="dev-java/xpp3:0
	dev-java/dnsjava:2
	dev-java/jstun:0
	dev-java/commons-logging:0"

DEPEND=">=virtual/jdk-1.6
	${COMMON_DEP}"
RDEPEND=">=virtual/jre-1.6
	${COMMON_DEP}"

S="${WORKDIR}/${MY_P}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_XML="build/build.xml"
EANT_GENTOO_CLASSPATH="ant-contrib,commons-logging,dnsjava-2,jstun,xpp3"

java_prepare() {
	find -name '*.jar' -print -delete ||die
	epatch "${FILESDIR}/${P}-build.patch"
}
