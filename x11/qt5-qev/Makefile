PORTNAME=	qev
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	x11
PKGNAMEPREFIX=	qt5-

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Qt QWidget events introspection tool

USES=		compiler:c++11-lang qmake qt-dist:5,tools
USE_QT=		core widgets

QT_BINARIES=	yes

post-install:
	${RLN} ${STAGEDIR}${QT_BINDIR}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}5

.include <bsd.port.mk>
