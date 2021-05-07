PORTNAME=	quick3d
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	x11-toolkits
PKGNAMEPREFIX=	qt5-

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Set of controls for building complete interfaces in Qt Quick3D

USES=		compiler:c++11-lang qmake qt-dist:5
USE_QT=		core declarative gui network opengl \
		buildtools_build

post-install:
	${RLN} ${STAGEDIR}${QT_BINDIR}/balsam ${STAGEDIR}${PREFIX}/bin/balsam5
	${RLN} ${STAGEDIR}${QT_BINDIR}/meshdebug ${STAGEDIR}${PREFIX}/bin/meshdebug5

.include <bsd.port.mk>
