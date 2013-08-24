# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit java-pkg-2 java-ant-2

DESCRIPTION="libjitsi is an advanced Java media library for secure real-time audio/video communication."
HOMEPAGE="https://jitsi.org/Projects/LibJitsi"
SRC_URI="https://download.jitsi.org/${PN}/src/${PN}-src-${PV}.zip"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=virtual/jdk-1.6
		dev-java/bcprov
		dev-java/cpptasks
		>=dev-java/json-simple-1.1
		dev-java/jspeex
		dev-java/osgi-core-api
		app-arch/unzip"

RDEPEND="${DEPEND}
		virtual/jre"

S="${WORKDIR}/${PN}"

java_prepare() {
	#find . -name '*.jar' -print -delete || die
	for jar in json-simple-1.1.1.jar osgi.core.jar bcprov-jdk15on-148.jar; \
		do rm "${S}/lib/${jar}";done || die

	pushd lib > /dev/null
		java-pkg_jar-from jspeex jspeex.jar
		java-pkg_jar-from json-simple json-simple.jar json-simple-1.1.1.jar
		java-pkg_jar-from osgi-core-api osgi-core-api.jar osgi.core.jar
		java-pkg_jar-from bcprov bcprov.jar bcprov-jdk15on-148.jar
	popd > /dev/null

	for jar in cpptasks.jar; \
		do rm "${S}/lib/installer-exclude/${jar}";done || die

	pushd lib/installer-exclude > /dev/null
		java-pkg_jar-from cpptasks cpptasks.jar
	popd > /dev/null

}

src_install() {
	java-pkg_newjar libjitsi.jar
}
