# $FreeBSD$

PORTNAME=	texlive
PORTVERSION=	20150521
PORTREVISION=	56
CATEGORIES=	print
MASTER_SITES=	TEX_CTAN/systems/texlive/Source/
PKGNAMESUFFIX=	-base
DISTNAME=	${PORTNAME}-${DISTVERSION}-source
DIST_SUBDIR=	TeX

MAINTAINER=	latex@FreeBSD.org
COMMENT=	TeX Live Typesetting System, base binaries

CONFLICTS_INSTALL=	ps2eps texlive-texmf-201[234]*

USES=		compiler:c++11-lib ghostscript localbase pkgconfig perl5 \
		python:run shebangfix tar:xz
USE_CXXSTD=	gnu++11
USE_PERL5=	run
USE_TEX=	web2c kpathsea ptexenc tlmgr texhash-bootstrap
HAS_CONFIGURE=	YES
CONFIGURE_OUTSOURCE=	YES

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
		--with-system-poppler \
		--with-system-xpdf \
		--with-system-zlib \
		--with-system-zziplib \
		--disable-native-texlive-build \
		--with-banner-add=/FreeBSD \
		--enable-shared \
		--prefix=${PREFIX}

.include <bsd.port.mk>
