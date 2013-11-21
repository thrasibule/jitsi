# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 subversion

DESCRIPTION="Jingle Relay Nodes API in java"
HOMEPAGE="http://www.jinglenodes.org"
ESVN_REPO_URI="http://jinglenodes.googlecode.com/svn/trunk/jnsapi_java"

LICENSE="LGPL-2.1"
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
EANT_GENTOO_CLASSPATH="smack-3.2,xpp3"

src_prepare() {
	default
	cp "${FILESDIR}/build.xml" .
}

src_install() {
	java-pkg_dojar "dist/lib/${PN}.jar"
}
