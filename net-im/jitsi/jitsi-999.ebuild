# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit java-pkg-2 java-ant-2 eutils git-r3 multilib prefix

DESCRIPTION="An audio/video SIP VoIP phone and instant messenger written in Java"
HOMEPAGE="http://www.jitsi.org/"
EGIT_REPO_URI="http://github.com/jitsi/jitsi.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="" # FIXME: Should not use ALSA directly, unless USE="alsa", because e.g. PulseAudio could already use and block it.

COMMON_DEP="dev-java/dnsjava:2
	dev-java/gdata:0
	dev-java/libjitsi:0
	dev-java/laf-widget:4.3
	dev-java/ice4j:0"
RDEPEND=">=virtual/jdk-1.6
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.6
	${COMMON_DEP}"

#QA_PREBUILT="usr/lib*/${PN}/lib/native/*"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_TARGET="rebuild"
EANT_GENTOO_CLASSPATH="ant-core,apple-java-extensions-bin,bcprov,dnsjava-2,gdata,ice4j,fmj,laf-widget-4.3,libjitsi,jna,osgi-core-api,zrtp4j"

java_prepare() {
	einfo "Evil jar files be gone"
	find . -name '*.jar' -print -delete || die
	#Add jar symlinks
	#pushd lib/installer-exclude > /dev/null
	#	java-pkg_jar-from ant-core ant.jar apache-ant-1.7.0.jar
	#	java-pkg_jar-from cpptasks cpptasks.jar
	#popd > /dev/null
}
