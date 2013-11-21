# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/joscar/joscar-0.9.3.ebuild,v 1.9 2006/10/05 17:48:40 gustavoz Exp $

EAPI=5

inherit java-pkg-2 java-ant-2 subversion

DESCRIPTION="A Java library for AIM's OSCAR protocol"
ESVN_REPO_URI="http://joscar.googlecode.com/svn/trunk/"
HOMEPAGE="http://joust.kano.net/joscar"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

DEPEND=">=virtual/jdk-1.5"
RDEPEND=">=virtual/jre-1.5"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_BUILD_TARGET="jars"
EANT_DOC_TARGET="javadoc"
EANT_GENTOO_CLASSPATH="ant-core"

src_install() {
	java-pkg_dojar $(ls dist/*.jar)
}
