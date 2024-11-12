FROM coqorg/coq:8.11

RUN opam repo add coq-extra-dev https://coq.inria.fr/opam/extra-dev \
 && opam update \
 && opam install -y coq-simple-io.1.3.0 coq-quickchick.1.3.2

# install pdflatex
RUN sudo apt-get update && sudo apt-get install texlive-latex-base texlive-latex-extra latex-cjk-all
# sudo apt-get install texlive-fonts-recommended texlive-fonts-extra 
