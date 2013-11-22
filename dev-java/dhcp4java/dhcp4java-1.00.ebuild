# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="mirror://sourceforge/dhcp4java/dhcp4java/dhcp4java-1.00/${P}.src.zip"
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

EANT_BUILD_TARGET=""
EANT_DOC_TARGET=""

S="${WORKDIR}"

src_prepare() {
	cp "${FILESDIR}"/build.xml "${S}"
}

src_install() {
  java-pkg_dojar "dist/${PN}.jar"
}
