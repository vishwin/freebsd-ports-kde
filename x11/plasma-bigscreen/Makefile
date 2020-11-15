# $FreeBSD$

PORTNAME=	plasma-bigscreen
DISTVERSION=	2.1.0
CATEGORIES=	x11 kde

LICENSE=	GPLv2

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Plasma shell for TVs

USES=		cmake kde:5 python:3.5+,run qt:5 shebangfix shebangfix
USE_KDE=	activities activities-stats auth codecs completion config \
		configwidgets coreaddons ecm i18n jobwidgets kcmutils \
		kdeclarative kio notifications package plasma-framework \
		plasma-workspace service widgetsaddons windowsystem
USE_QT=		concurrent core dbus declarative gui network widgets xml \
		buildtools_build qmake_build
USE_GITHUB=	yes
GH_ACCOUNT=	KDE
GH_TAGNAME=	8a1ef82

SHEBANG_FILES=	bin/mycroft-skill-launcher.py

post-patch:
	${REINPLACE_CMD} -e '/SlidePaths/s|/usr/share|${LOCALBASE}|g' \
		${WRKSRC}/shell/contents/layout.js \
		${WRKSRC}/lookandfeel/contents/layouts/org.kde.plasma.mycroft.bigscreen-layout.js

.include <bsd.port.mk>
