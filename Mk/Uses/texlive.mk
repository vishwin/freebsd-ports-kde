# $FreeBSD$
#
# Usage
#    USES=texlive
#    USE_TEXLIVE=<binary>
#    USE_TEXLIVE=<colleciton1> <collection2>...
#
# MAINTAINER:	latex@FreeBSD.org

.if !defined(_TEXLIVE_MK_INCLUDED)
_TEXLIVE_MK_INCLUDED=	texlive.mk

_TEXLIVE_COLLECTIONS=	basic \
			bibtexextra \
			binextra \
			context \
			fontsextra \
			fontsrecommended \
			fontutils \
			formatsextra \
			games \
			humanities \
			langarabic \
			langchinese \
			langcjk \
			langcyrillic \
			langczechslovak \
			langenglish \
			langeuropean \
			langfrench \
			langgerman \
			langgreek \
			langitalian \
			langjapanese \
			langkorean \
			langother \
			langpolish \
			langportuguese \
			langspanish \
			latex \
			latexextra \
			latexrecommended \
			luatex \
			mathscience \
			metapost \
			music \
			pictures \
			plaingeneric \
			pstricks \
			publishers \
			texworks \
			wintools \
			xetex


.endif
