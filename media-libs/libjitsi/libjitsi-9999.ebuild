# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

JAVA_PKG_IUSE="doc source"
WANT_ANT_TASKS="dev-java/cpptasks:0"

inherit java-pkg-2 java-ant-2 git-r3

DESCRIPTION="A java library for secure realtime A/V communication"
HOMEPAGE="http://jitsi.org/Projects/LibJitsi"
EGIT_REPO_URI="http://github.com/jitsi/libjitsi.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""

IUSE="doc"

COMMON_DEP="dev-java/bcprov:0
	dev-java/bccontrib:0
	dev-java/bcpkix:0
	dev-java/ice4j:0
	dev-java/jna:0
	dev-java/jsip:0
	dev-java/json-simple:0
	dev-java/osgi-core-api:0
	dev-java/sdes4j:0
	dev-java/zrtp4j:0
	media-libs/fmj:0
	media-libs/libvpx
	media-libs/speex
	media-libs/opus
	media-sound/pulseaudio
	virtual/ffmpeg"

RDEPEND=">=virtual/jre-1.6
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.6
	app-arch/unzip
	${COMMON_DEP}"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_TARGET="rebuild ffmpeg jawtrenderer video4linux2 speex screencapture opus libvpx pulseaudio g722"
EANT_DOC_TARGET="javadoc"
EANT_GENTOO_CLASSPATH="bcprov,bccontrib,bcpkix,fmj,ice4j,jna,jsip,json-simple,osgi-core-api,sdes4j,zrtp4j"

java_prepare() {
	find -name *.jar -print -delete
	find -name *.so -print -delete
	epatch "${FILESDIR}/${PN}-build.patch" \
		"${FILESDIR}/${PN}-libav9.patch" \
		"${FILESDIR}/${PN}-libav10.patch"
}

src_install() {
	java-pkg_dojar "${PN}.jar"
	java-pkg_doso lib/native/linux/*.so
	use doc && java-pkg_dojavadoc build/javadoc
	use source && java-pkg_dosrc src
}
