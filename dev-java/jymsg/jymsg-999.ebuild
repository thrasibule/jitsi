# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 subversion

DESCRIPTION="A Java library for Yahoo Instant Messenger"
HOMEPAGE="http://sourceforge.net/apps/trac/openymsg/"
ESVN_REPO_URI="http://svn.code.sf.net/p/openymsg/code/branches/jymsg"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

IUSE=""

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.5
  ${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
  app-arch/unzip
  ${COMMON_DEP}"

EANT_BUILD_TARGET="jars"

src_install() {
  java-pkg_newjar "classes/ymsg_network_v0_67.jar" "${PN}.jar"
}
