# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="A Java library to read ICO files"
HOMEPAGE="http://sourceforge.net/projects/aclibico"
SRC_URI="mirror://sourceforge/aclibico/aclibico/${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

IUSE=""

COMMON_DEP="dev-java/log4j:0"

RDEPEND=">=virtual/jre-1.4
  ${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.4
  app-arch/unzip
  ${COMMON_DEP}"

EANT_GENTOO_CLASSPATH="log4j"

S="${WORKDIR}/${PV}"

src_unpack() {
	default
	cd "${S}"
	unzip AC.lib-ICO-src-2.100.zip ||die
}

src_prepare() {
	rm src/com/ctreber/aclib/DemoApp{,SPI}.java
	cp "${FILESDIR}"/build.xml "${S}"
}

src_install() {
  java-pkg_dojar "dist/lib/${PN}.jar"
}
