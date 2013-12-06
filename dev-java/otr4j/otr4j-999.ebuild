# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="test"

inherit java-pkg-2 java-ant-2 git-r3

DESCRIPTION="An implementation of the OTR protocol in Java"
HOMEPAGE="http://github.com/jitsi/otr4j"
EGIT_REPO_URI="http://github.com/jitsi/${PN}.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""

IUSE=""

COMMON_DEP="dev-java/bcprov:0"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	test? ( dev-java/junit:4 )
	${COMMON_DEP}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_GENTOO_CLASSPATH="bcprov"
EANT_TEST_GENTOO_CLASSPATH="${EANT_GENTOO_CLASSPATH},junit-4"
EANT_TEST_TARGET="junit"
EANT_TEST_ANT_TASKS="ant-junit"


java_prepare() {
	cp "${FILESDIR}"/build.xml "${S}" || die
}

src_install() {
	java-pkg_dojar "bin/jar/${PN}.jar"
}

src_test() {
	java-pkg-2_src_test
}
