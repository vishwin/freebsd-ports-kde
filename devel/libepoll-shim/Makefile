# Created by: Johannes Lundberg <johalun0@gmail.com>
# $FreeBSD$

PORTNAME=	libepoll-shim
PORTVERSION=	0.0.20191117
CATEGORIES=	devel

MAINTAINER=	x11@FreeBSD.org
COMMENT=	Small epoll implementation using kqueue

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake compiler:c11
USE_LDCONFIG=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	jiixyj
GH_PROJECT=	epoll-shim
GH_TAGNAME=	1f003fa40f8ac3858dcc474b96cc4aee5820dcd2

do-test:
	# Exclude certain tests in resource restricted environments
	@(if [ `ulimit -n` -lt 20100 ]; then \
	    SKIP_TESTS="-E ^(perf-many-fds.perf_many_fds__perf"; \
	    if [ `ulimit -n` -lt 1100 ]; then \
	        SKIP_TESTS=$$SKIP_TESTS"|timerfd-test.timerfd__many_timers"; \
	    fi; \
	    SKIP_TESTS=$$SKIP_TESTS")$$"; \
	fi; \
	cd ${TEST_WRKSRC} && ctest -C ${CMAKE_BUILD_TYPE} $$SKIP_TESTS)

.include <bsd.port.mk>
