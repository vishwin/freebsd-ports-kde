# $FreeBSD$

PORTNAME=	texlive
DISTVERSION=	${TEXLIVE_VERSION}
DISTVERSIONSUFFIX=	${TEXLIVE_VERSIONSUFFIX}
CATEGORIES=	print
PKGNAMESUFFIX=	-bin
DIST_SUBDIR=	TeX

MAINTAINER=	latex@FreeBSD.org
COMMENT=	TeX Live Typesetting System, base binaries

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libgd.so:graphics/gd \
		libgmp.so:math/gmp \
		libgraphite2.so:graphics/graphite2 \
		libharfbuzz.so:print/harfbuzz \
		libicudata.so:devel/icu \
		libicui18n.so:devel/icu \
		libicuio.so:devel/icu \
		libicuuc.so:devel/icu \
		libmpfr.so:math/mpfr \
		libpaper.so:print/libpaper \
		libpng16.so:graphics/png \
		libXaw.so:x11-toolkits/libXaw \
		libzzip.so:devel/zziplib

USES=		compiler:c++11-lib ghostscript gnome libtool localbase \
		pkgconfig perl5 python:run shebangfix tar:xz texlive:dist \
		xorg
USE_CXXSTD=	gnu++11
USE_GNOME=	cairo
USE_XORG=	ice pixman sm x11 xext xi xmu xpm xt
SHEBANG_FILES=	texk/texlive/linked_scripts/*/*
GNU_CONFIGURE=	YES
CONFIGURE_OUTSOURCE=	YES
USE_GITHUB=	YES
GH_ACCOUNT=	Tex-Live
GH_PROJECT=	texlive-source

CONFIGURE_ARGS=	--with-system-cairo \
		--with-system-freetype2 \
		--with-system-gd \
		--with-system-gmp \
		--with-system-graphite2 \
		--with-system-harfbuzz \
		--with-system-icu \
		--with-system-libpaper \
		--with-system-libpng \
		--with-system-mpfr \
		--with-system-pixman \
		--with-system-zlib \
		--with-system-zziplib \
		--disable-native-texlive-build \
		--with-banner-add=/FreeBSD \
		--enable-shared \
		--prefix=${PREFIX}

INFO=		dvipng dvips kpathsea tlbuild web2c

TEXLIVE_VERSION=	2020.svn54456
TEXLIVE_VERSIONSUFFIX=	-282-gdf578d4f4

.include <bsd.port.mk>
