
TARGETS=$(addprefix src/, seq.cma seq.cmxa seq.cmxs)
build:
	ocamlbuild $(TARGETS)

clean:
	ocamlbuild -clean

install:
	ocamlfind install seq META _build/src/*.cm* _build/src/*.ml*

.PHONY: build clean install
