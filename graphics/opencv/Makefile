# $FreeBSD$

PORTNAME=	opencv
DISTVERSION=	4.5.1
CATEGORIES=	graphics

MAINTAINER=	tcberner@FreeBSD.org
COMMENT=	Open Source Computer Vision library

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	vulkan-headers>0:graphics/vulkan-headers \
		opencl>=0:devel/opencl
RUN_DEPENDS=	opencl>=0:devel/opencl
LIB_DEPENDS=	\
		libIlmImf.so:graphics/openexr \
		libavcodec.so:multimedia/ffmpeg \
		libfreetype.so:print/freetype2 \
		libgflags.so:devel/gflags \
		libglog.so:devel/glog \
		libgphoto2.so:graphics/libgphoto2 \
		libharfbuzz.so:print/harfbuzz \
		libhdf5.so:science/hdf5 \
		libopenblas.so:math/openblas \
		libpng16.so:graphics/png \
		libtbb.so:devel/tbb \
		libtiff.so:graphics/tiff \
		libwebp.so:graphics/webp \


USES=		cmake compiler:c++14-lang eigen:3 jpeg localbase:ldflags pkgconfig python:3.6+
USE_GITHUB=	yes
GH_PROJECT=	opencv_contrib:contrib \
		ade:ade \
		opencv_3rdparty:extra_mod_3rdparty_boost_descr \
		opencv_3rdparty:extra_mod_3rdparty_vgg_descr
GH_TAGNAME=	v0.1.1f:ade \
		34e4206aef44d50e6bbcd0ab06354b52e7466d26:extra_mod_3rdparty_boost_descr \
		fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d:extra_mod_3rdparty_vgg_descr


CMAKE_ON=	\
		WITH_EIGEN  \
		WITH_GDAL \
		WITH_GDCM \
		WITH_GPHOTO2 \
		WITH_GSTREAMER \
		WITH_JASPER \
		WITH_JPEG \
		WITH_OPENCL \
		WITH_OPENEXR \
		WITH_OPENGL \
		WITH_PNG \
		WITH_TBB \
		WITH_TIFF \
		WITH_VULKAN \
		WITH_WEBP \
		OPENCV_GENERATE_PKGCONFIG \
		OPENCV_ENABLE_NONFREE
CMAKE_OFF=	OPENCV_GENERATE_SETUPVARS \
		BUILD_TESTS
CMAKE_ARGS=	-DOPENCV_EXTRA_MODULES_PATH="${WRKSRC}/contrib/modules" \
		-DOPENCV_PYTHON3_INSTALL_PATH=${PYTHON_SITELIBDIR} \
		-DVULKAN_INCLUDE_DIRS=${LOCALBASE}/include

_OPENCV_PACKAGE?=	base

# Subpackages
_base_CMAKE_OFF=	BUILD_openv_java BUILD_opencv_python3
_base_USE_PYTHON=	noflavors

_java_BUILD_DEPENDS=	ant:devel/apache-ant
_java_LIB_DEPENDS=	libopencv_ml.so:graphics/opencv
_java_CMAKE_ON=		BUILD_openv_java
_java_CMAKE_OFF=	BUILD_opencv_python3
_java_USE_PYTHON=	noflavors

_python_LIB_DEPENDS=	libopencv_ml.so:graphics/opencv
_python_USES=		python:3.6+
_python_USE_PYTHON=	flavors
_python_CMAKE_ON=	BUILD_opencv_python3
_python_CMAKE_OFF=	BUILD_openv_java

. for _var in BUILD_DEPENDS RUN_DEPENDS BUILD_DEPENDS CMAKE_ON CMAKE_OFF CMAKE_ARGS USE_PYTHON USES
${_var}+=		${_${_OPENCV_PACKAGE}_${_var}}
.endfor

post-extract:
	${MV} ${WRKSRC_contrib} ${WRKSRC}/contrib
	${MKDIR} ${BUILD_WRKSRC}/3rdparty/ade
	${MV} ${WRKSRC_ade} ${BUILD_WRKSRC}/3rdparty/ade
	${MKDIR} ${WRKSRC}/contrib/modules/xfeatures2d/src
	${MV} ${WRKSRC_extra_mod_3rdparty_boost_descr}/* ${WRKSRC}/contrib/modules/xfeatures2d/src
	${MV} ${WRKSRC_extra_mod_3rdparty_vgg_descr}/* ${WRKSRC}/contrib/modules/xfeatures2d/src

.include <bsd.port.mk>
