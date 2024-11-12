#!/bin/bash

docker build . -t sfbuilder

# opam repo add coq-extra-dev https://coq.inria.fr/opam/extra-dev && opam update && opam install -y coq-simple-io.1.3.0 coq-quickchick.1.3.2
docker run -it -v .:/work coqorg/coq:8.10 # sfbuilder

export COQDOCEXTRAFLAGS='-p \\usepackage{ctex}'
make

# ~/.opam/4.07.1+flambda/.opam-switch/sources/coq/tools/coqdoc/coqdoc.sty
"coqdoc" \
	-toc -interpolate -utf8 --latex -p \\usepackage{ctex} -Q . LF  \
	-o all.tex `"coqdep" -sort -suffix .v Preface.v Basics.v Induction.v Lists.v Poly.v Tactics.v Logic.v IndProp.v Maps.v ProofObjects.v IndPrinciples.v Rel.v Imp.v ImpParser.v ImpCEvalFun.v Extraction.v Auto.v AltAuto.v Postscript.v Bib.v  PrefaceTest.v BasicsTest.v InductionTest.v ListsTest.v PolyTest.v TacticsTest.v LogicTest.v IndPropTest.v MapsTest.v ProofObjectsTest.v IndPrinciplesTest.v RelTest.v ImpTest.v ImpParserTest.v ImpCEvalFunTest.v ExtractionTest.v AutoTest.v AltAutoTest.v PostscriptTest.v BibTest.v`
