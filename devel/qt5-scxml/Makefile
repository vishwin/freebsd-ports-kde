PORTNAME=	scxml
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Qt5 SXCML module

USES=		compiler:c++11-lang qmake qt-dist:5,scxml
USE_QT=		core declarative network buildtools_build

QT_BINARIES=	yes

post-install:
	${RLN} ${STAGEDIR}${QT_BINDIR}/qscxmlc ${STAGEDIR}${PREFIX}/bin/qscxmlc5

.include <bsd.port.mk>
