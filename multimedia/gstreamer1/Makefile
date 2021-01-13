# Created by: Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
# $FreeBSD$

PORTNAME=	gstreamer
PORTVERSION=	1.18.2
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gstreamer/
PKGNAMESUFFIX=	1

MAINTAINER=	multimedia@FreeBSD.org
COMMENT=	Media applications framework

LICENSE=	LGPL20
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		bison gettext gmake gnome libtool meson pathfix \
		perl5 pkgconfig python tar:xz shebangfix
USE_PERL5=	build
USE_GNOME=	glib20 introspection:build
MESON_ARGS=	-Ddoc=disabled -Dgtk_doc=disabled
SHEBANG_FILES=	docs/gst-plugins-doc-cache-generator.py \
		gst/parse/gen_lex.py.in \
		gst/parse/gen_grammar.py.in \
		gst/parse/get_flex_version.py \
		scripts/dist-translations.py \
		scripts/extract-release-date-from-doap-file.py

PLIST_SUB=	VERSION=${GST10_VERSION} \
		SOVERSION=0.1802.0

USE_LDCONFIG=	yes
GST10_VERSION=	1.0

PORTSCOUT=	limitw:1,even

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	NLS

OPTIONS_DEFINE_aarch64=		LIBUNWIND
OPTIONS_DEFFAULT_aarch64=	LIBUNWIND
OPTIONS_DEFINE_amd64=		LIBUNWIND
OPTIONS_DEFAULT_amd64=		LIBUNWIND
OPTIONS_DEFINE_i386=		LIBUNWIND
OPTIONS_DEFFAULT_i386=		LIBUNWIND

NLS_USES=	gettext
NLS_MESON_ENABLED=	nls

LIBUNWIND_DESC=		Libunwind is optionally used by the leaks tracer
LIBUNWIND_LIB_DEPENDS=	libunwind.so:devel/libunwind
LIBUNWIND_MESON_ENABLED=	libunwind

.include <bsd.port.mk>
