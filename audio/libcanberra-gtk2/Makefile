# $FreeBSD$

CATEGORIES=	audio devel
PKGNAMESUFFIX=	-gtk2
PORTREVISION=	0

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	Implementation of the Freedesktop sound theme spec (GTK2 bindings)

MASTERDIR=	${.CURDIR}/../../audio/libcanberra
PLIST=		${.CURDIR}/pkg-plist

do-build:
	cd ${BUILD_WRKSRC} \
		&& ${MAKE_ENV} ${GMAKE} \
			libcanberra-gtk.pc
	cd ${BUILD_WRKSRC}/src \
		&& ${MAKE_ENV} ${GMAKE} \
			libcanberra-gtk.la \
			libcanberra-gtk-module.la  \
			canberra-gtk-play

do-install:
	${INSTALL_DATA} ${INSTALL_WRKSRC}/libcanberra-gtk.pc \
		${STAGEDIR}${PREFIX}/libdata/pkgconfig/
	${INSTALL_DATA} ${INSTALL_WRKSRC}/src/canberra-gtk.h \
		${STAGEDIR}${PREFIX}/include
.for i in .so .so.0 .so.0.1.9
	${INSTALL_LIB} ${INSTALL_WRKSRC}/src/.libs/libcanberra-gtk${i} \
		${STAGEDIR}${PREFIX}/lib/
.endfor
	${INSTALL_PROGRAM} ${INSTALL_WRKSRC}/src/.libs/canberra-gtk-play \
		${STAGEDIR}${PREFIX}/bin/
	${MKDIR} ${STAGEDIR}${PREFIX}/share/vala/vapi
	${INSTALL_DATA} ${INSTALL_WRKSRC}/vala/libcanberra-gtk.vapi \
		${STAGEDIR}${PREFIX}/share/vala/vapi
	cd ${INSTALL_WRKSRC}/src && env DESTDIR=${STAGEDIR} ${GMAKE} install-gtkmoduleLTLIBRARIES
	cd ${INSTALL_WRKSRC}/src && env DESTDIR=${STAGEDIR} ${GMAKE} install-dist_gsdgtkmodulesDATA
	${LN} -sf libcanberra-gtk-module.so \
		${STAGEDIR}${PREFIX}/lib/gtk-2.0/modules/libcanberra-gtk-module.so

.include "${MASTERDIR}/Makefile"
