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
KEYWORDS=""
IUSE="" # FIXME: Should not use ALSA directly, unless USE="alsa", because e.g. PulseAudio could already use and block it.

COMMON_DEP="dev-java/aclibico:0
	dev-java/commons-httpclient:3
	dev-java/dbus-java:0
	dev-java/dhcp4java:0
	dev-java/dict4j:0
	dev-java/dnsjava:2
	dev-java/gdata:0
	dev-java/httpcomponents-client:0
	dev-java/httpcomponents-core:0
	dev-java/jsip:0
	dev-java/libjitsi:0
	dev-java/laf-widget:4.3
	dev-java/ice4j:0
	dev-java/jcalendar:1.2
	dev-java/jmdns:3.4
	dev-java/jml:0
	dev-java/joscar:0
	dev-java/jsch:0
	dev-java/json-simple:0
	dev-java/jymsg:0
	dev-java/otr4j:0
	dev-java/pircbot:0
	dev-java/rome:0
	dev-java/smack:3.2
	dev-java/xpp3:0
	dev-java/zrtp4j:0"
RDEPEND=">=virtual/jdk-1.6
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.6
	${COMMON_DEP}"

#QA_PREBUILT="usr/lib*/${PN}/lib/native/*"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_TARGET="rebuild"
EANT_GENTOO_CLASSPATH="aclibico,ant-core,apple-java-extensions-bin,bcprov,commons-httpclient-3,dbus-java,dnsjava-2,dhcp4java,dict4j,gdata,ice4j,fmj,httpcomponents-client,httpcomponents-core,jcalendar-1.2,jinglenodes,jmdns-3.4,jml,joscar,jsip,jsch,json-simple,jymsg,otr4j,laf-widget-4.3,libjitsi,jna,osgi-core-api,otr4j,pircbot,rome,sdes4j,smack-3.2,xpp3,zrtp4j"

java_prepare() {
	einfo "Evil jar files be gone"
	find . -name '*.jar' -print -delete || die
	rm -rf src/net/java/sip/communicator/impl/growlnotification || die
	pushd src > /dev/null
	for f in $(ag -l macwidgets); do
		sed -i -e "/macwidgets/d" $f
	done
	for f in $(ag -l jdic); do
		sed -i -e "/jdic/d" $f
	done
	popd > /dev/null
	#Add jar symlinks
	#pushd lib/installer-exclude > /dev/null
	#	java-pkg_jar-from ant-core ant.jar apache-ant-1.7.0.jar
	#	java-pkg_jar-from cpptasks cpptasks.jar
	#popd > /dev/null
}
