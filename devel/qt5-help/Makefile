PORTNAME=	help
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Qt online help integration module

USES=		compiler:c++11-lang qmake qt-dist:5,tools
USE_QT=		core gui network sql widgets \
		buildtools_build sql-sqlite3_run

QT_BINARIES=	yes

post-install:
.for t in qcollectiongenerator qhelpgenerator
	${RLN} ${STAGEDIR}${QT_BINDIR}/${t} ${STAGEDIR}${PREFIX}/bin/${t}5
.endfor

.include <bsd.port.mk>
