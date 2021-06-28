PORTNAME=	wayland
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	2
CATEGORIES=	graphics
PKGNAMEPREFIX=	qt5-

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Qt5 wrapper for Wayland

BUILD_DEPENDS=	${LOCALBASE}/include/libdrm/drm_fourcc.h:graphics/libdrm
LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libwayland-egl.so:graphics/wayland \
		libxkbcommon.so:x11/libxkbcommon

USES=		compiler:c++11-lang gl gnome pkgconfig qmake:norecursive \
		qt-dist:5,wayland
USE_GL=		egl
USE_GNOME=	glib20
USE_QT=		core dbus gui declarative \
		buildtools_build qmake_build

QT_BINARIES=	yes

OPTIONS_DEFINE=	X11
OPTIONS_DEFAULT=X11
OPTIONS_SUB=	yes

X11_USES=	xorg
X11_USE=	XORG=x11,xcomposite
X11_VARS=	USE_GL+=gl

.include <bsd.port.mk>
