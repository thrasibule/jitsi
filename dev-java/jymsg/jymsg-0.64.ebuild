# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="A Java library for Yahoo Instant Messenger"
HOMEPAGE="http://jymsg9.sourceforge.net"
SRC_URI="mirror://sourceforge/jymsg9/jymsg9/ymsg_code_source_v0_64.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.4
  ${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.4
  app-arch/unzip
  ${COMMON_DEP}"

EANT_BUILD_TARGET="jars"

S="${WORKDIR}"

src_install() {
  java-pkg_newjar "classes/ymsg_network_v0_64.jar" "${PN}_network.jar"
  java-pkg_newjar "classes/ymsg_support_v0_64.jar" "${PN}_support.jar"
}
