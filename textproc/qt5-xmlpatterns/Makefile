PORTNAME=	xmlpatterns
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	textproc
PKGNAMEPREFIX=	qt5-

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Qt support for XPath, XQuery, XSLT and XML Schema

USES=		compiler:c++11-lang qmake:norecursive qt-dist:5,xmlpatterns
USE_QT=		core declarative network buildtools_build

QT_BINARIES=	yes

post-install:
	${RLN} ${STAGEDIR}${QT_BINDIR}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}5
	${RLN} ${STAGEDIR}${QT_BINDIR}/${PORTNAME}validator ${STAGEDIR}${PREFIX}/bin/${PORTNAME}validator5

.include <bsd.port.mk>
