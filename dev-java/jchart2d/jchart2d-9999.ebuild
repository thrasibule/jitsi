# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 git-r3

DESCRIPTION="A minimalistic realtime charting library"
HOMEPAGE="http://jchart2d.sourceforge.net/"
EGIT_REPO_URI="git://git.code.sf.net/p/jchart2d/code"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86"

IUSE=""

COMMON_DEP="dev-java/xmlgraphics-commons:1.5"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEP}"

EANT_BUILD_TARGET="makejarFat"
EANT_DOC_TARGET=""

java_prepare() {
	epatch "${FILESDIR}/build.patch"
	find . -name '*.jar' -delete|| die
	pushd ext
	java-pkg_jar-from xmlgraphics-commons-1.5
	popd
}

src_install() {
	java-pkg_newjar "${PN}-3.3.0.jar" "${PN}.jar"
}
