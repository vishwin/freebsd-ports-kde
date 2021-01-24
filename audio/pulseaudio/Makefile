# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>
# $FreeBSD$
#
# !!!NOTE!!! Any PORTVERSION update to this port must be accompanied by
# PORTREVISION bumps of depending ports.

PORTNAME=	pulseaudio
DISTVERSION=	14.2
CATEGORIES=	audio
MASTER_SITES=	https://freedesktop.org/software/pulseaudio/releases/

MAINTAINER=	desktop@FreeBSD.org
COMMENT=	Sound server for UNIX

LICENSE=	LGPL21
LICENSE_FILE=	${WRKSRC}/LGPL

BUILD_DEPENDS=	p5-XML-Parser>=0:textproc/p5-XML-Parser
LIB_DEPENDS=	libsndfile.so:audio/libsndfile \
		libfftw3.so:math/fftw3 \
		libfftw3f.so:math/fftw3-float \
		libdbus-1.so:devel/dbus \
		libltdl.so:devel/libltdl \
		libck-connector.so:sysutils/consolekit2

USES=		compiler:c11 cpe gettext gmake gnome iconv libtool localbase:ldflags \
		meson pathfix pkgconfig python:run shebangfix ssl tar:xz xorg

USE_GNOME=	glib20
USE_XORG=	ice sm x11 xcb xtst
USE_LDCONFIG=	yes

SHEBANG_FILES=	shell-completion/bash/pulseaudio \
		src/utils/pa-info \
		src/utils/qpaeq
bash_CMD=	${SETENV} bash
SUB_FILES=	pkg-message

MESON_ARGS=	-Dlocalstatedir=/var \
		-Dudev=disabled \
		-Dgtk=disabled \
		-Dsystemd=disabled \
		-Dlirc=disabled \
		-Dbluez5=false \
		-Db_lundef=false

USERS=		pulse
GROUPS=		pulse pulse-access pulse-rt

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	AVAHI GCONF GSETTINGS SIMD TEST
OPTIONS_DEFAULT=AVAHI SIMD SIMPLE SOXR SPEEX WEBRTC_AEC
AVAHI_MESON_ENABLED=	avahi
AVAHI_LIB_DEPENDS=	libavahi-client.so:net/avahi-app
GCONF_MESON_ENABLED=	gconf
GCONF_USE=	GNOME=gconf2
GSETTINGS_DESC=	GSettings configuration backend support
GSETTINGS_MESON_ENABLED=	gsettings
GSETTINGS_VARS=	GLIB_SCHEMAS=org.freedesktop.pulseaudio.gschema.xml
SIMD_MESON_ENABLED=	orc
SIMD_LIB_DEPENDS=	liborc-0.4.so:devel/orc
TEST_TEST_TARGET=	check
TEST_MESON_TRUE=	tests default-build-tests
TEST_BUILD_DEPENDS=	check>0:devel/check

OPTIONS_GROUP=	AUDIO
OPTIONS_GROUP_AUDIO=	ALSA JACK SOXR SPEEX WEBRTC_AEC
AUDIO_DESC=	Audio support
ALSA_MESON_ENABLED=	alsa
ALSA_LIB_DEPENDS=	libasound.so:audio/alsa-lib
JACK_MESON_ENABLED=	jack
JACK_LIB_DEPENDS=	libjack.so:audio/jack
SOXR_MESON_ENABLED=	soxr
SOXR_LIB_DEPENDS=	libsoxr.so:audio/libsoxr
SPEEX_DESC=	Speex resampler and AEC support
SPEEX_MESON_ENABLED=	speex
SPEEX_LIB_DEPENDS=	libspeexdsp.so:audio/speexdsp
WEBRTC_AEC_DESC=	WebRTC-based echo canceller
WEBRTC_AEC_LIB_DEPENDS=	libwebrtc_audio_processing.so:audio/webrtc-audio-processing0
WEBRTC_AEC_MESON_ENABLED=	webrtc-aec

OPTIONS_SINGLE=	DATABASE
OPTIONS_SINGLE_DATABASE=	TDB GDBM SIMPLE
DATABASE_DESC=	Database support
GDBM_DESC=	GNU database manager support
GDBM_MESON_ON=	-Ddatabase=gdbm
GDBM_LIB_DEPENDS=	libgdbm.so:databases/gdbm
SIMPLE_DESC=	Simple database support
SIMPLE_MESON_ON=	-Ddatabase=simple
TDB_DESC=	Trivial database support
TDB_MESON_ON=	-Ddatabase=tdb
TDB_LIB_DEPENDS=	libtdb.so:databases/tdb

PULSE_VERSION=	${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PLIST_SUB=	PULSE_VERSION=${PULSE_VERSION}

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/share|${LOCALBASE}/share|g' \
		${WRKSRC}/src/daemon/default.pa.in
	@${REINPLACE_CMD} -e 's|/etc|${PREFIX}/etc|g' \
		-e 's|--directory|-d|g' \
		${WRKSRC}/src/utils/pa-info

pre-install-TEST-on: do-test

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/etc/pulse
.for ii in default.pa daemon.conf system.pa
	${INSTALL_DATA} ${BUILD_WRKSRC}/src/daemon/${ii} \
		${STAGEDIR}${PREFIX}/etc/pulse/${ii}.sample
.endfor
.for ii in client.conf
	${INSTALL_DATA} ${BUILD_WRKSRC}/src/pulse/${ii} \
		${STAGEDIR}${PREFIX}/etc/pulse/${ii}.sample
.endfor

.include <bsd.port.mk>
