# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 git-r3

DESCRIPTION="A tiny UPnP client library written in Java"
HOMEPAGE="http://bitletorg.github.io/weupnp/"
EGIT_REPO_URI="http://github.com/bitletorg/weupnp.git"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86"

IUSE=""

RDEPEND=">=virtual/jre-1.5"
DEPEND=">=virtual/jdk-1.5
  app-arch/unzip"

java_prepare() {
	cp "${FILESDIR}"/build.xml .
}

src_install() {
  java-pkg_dojar "dist/lib/${PN}.jar"
  use doc && java-pkg_dojavadoc build/javadoc
  use source && java-pkg_dosrc src
}
