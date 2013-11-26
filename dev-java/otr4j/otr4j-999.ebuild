# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="test"

inherit java-pkg-2 java-ant-2 git-r3

DESCRIPTION="An implementation of the OTR protocol in Java"
HOMEPAGE=""
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

java_prepare() {
	cp "${FILESDIR}"/build.xml "${S}" || die
	mkdir lib|| die
	if use test; then
		mkdir test|| die
	fi
	cd lib;
	java-pkg_jar-from bcprov
	use test && java-pkg_jar-from junit-4
}

src_install() {
	java-pkg_dojar "bin/jar/${PN}.jar"
}

src_test() {
	ANT_TASKS="ant-junit" eant junit
}
