# $FreeBSD$

PORTNAME=	kpathsea
DISTVERSION=	${TEXLIVE_VERSION}
DISTVERSIONSUFFIX=	${TEXLIVE_VERSIONSUFFIX}
CATEGORIES=	devel
PKGNAMEPREFIX=	tex-
DIST_SUBDIR=	TeX

MAINTAINER=	latex@FreeBSD.org
COMMENT=	Path searching library for TeX

LICENSE=	LGPL21+

USES=		libtool pathfix tar:xz texlive:dist
USE_LDCONFIG=	yes
WRKSRC_SUBDIR=	texk/kpathsea
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

INFO=		kpathsea

post-install:
	cd ${WRKSRC}/../texlive/linked_scripts/texlive-extra && \
	    for f in kpsetool kpsewhere; do \
		${INSTALL_SCRIPT} $${f}.sh ${STAGEDIR}${PREFIX}/bin/$$f; \
	    done
	cd ${WRKSRC}/../texlive/tl_support && \
	    for f in kpsetool kpsewhere; do \
		${INSTALL_MAN} $${f}.1 ${STAGEDIR}${MANPREFIX}/man/man1/$${f}.1; \
	    done

.include <bsd.port.mk>
