# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 subversion

DESCRIPTION="Support for common \"feel\" widgets in look-and-feel libraries"
HOMEPAGE=""
ESVN_REPO_URI="https://svn.java.net/svn/"${PN}"~svn/tags/release_4_3_larkspur"

LICENSE="BSD"
SLOT="4.3"
KEYWORDS="~x86"

IUSE=""

COMMON_DEP="dev-java/asm:2"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEP}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_TARGET="all"
EANT_DOC_TARGET=""
EANT_GENTOO_CLASSPATH="ant-core,asm-2"

src_prepare() {
	default
	find . -name '*.jar' -print -delete ||die
	sed -i -e "s|jdk\.home.*$|jdk\.home=$(java-config -O)|" build.properties
}

src_install() {
	java-pkg_dojar "${{PN}".jar
}
