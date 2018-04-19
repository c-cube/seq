
TARGETS=$(addprefix src/, seq.cma seq.cmxa seq.cmxs)
build:
	ocamlbuild $(TARGETS)

clean:
	ocamlbuild -clean

TOINSTALL=$(wildcard _build/src/*)

install:
	ocamlfind install seq META $(TOINSTALL)

.PHONY: build clean install
