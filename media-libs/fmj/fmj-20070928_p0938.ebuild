# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit java-pkg-2 java-ant-2

DESCRIPTION="FMJ is an open-source project with the goal of providing an alternative to Java Media Framework (JMF)"
HOMEPAGE="http://fmj-sf.net/"
SRC_URI="mirror://sourceforge/fmj/fmj-20070928-0938.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="virtual/jdk:1.6"
RDEPEND="${DEPEND}
	virtual/jre:1.6"

S="${WORKDIR}/fmj"
