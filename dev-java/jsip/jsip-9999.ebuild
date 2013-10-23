# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 subversion

DESCRIPTION=""
HOMEPAGE=""
ESVN_REPO_URI="https://svn.java.net/svn/jsip~svn/trunk"

LICENSE=""
SLOT="0"
KEYWORDS=""

IUSE=""

COMMON_DEP="dev-java/jdom:1.0
	dev-java/log4j"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEP}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_TARGET="compilesdp compileri"
EANT_DOC_TARGET=""
EANT_GENTOO_CLASSPATH="ant-core,jdom-1.0,log4j"

src_prepare() {
	default
	find . -name '*.jar' -print -delete ||die
}

src_install() {
	java-pkg_newjar jain-sdp-1.0.1111.jar jain-sdp.jar
	java-pkg_newjar jain-sip-api-1.2.jar jain-sip-api.jar
	java-pkg_newjar jain-sip-ri-1.2.1111.jar jain-sip-ri.jar
}
