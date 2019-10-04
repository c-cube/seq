
all: build

OCAML_VERSION=$(shell ocaml -vnum)
SELECT_CMD=$(shell ocaml select_version.ml $(OCAML_VERSION))

select:
	$(SELECT_CMD)

OCAMLOPT := $(shell ocamlopt -version)
ifdef OCAMLOPT
	NATIVE_TARGETS := seq.cmxa seq.cmxs
endif

TARGETS=$(addprefix src/, seq.cma $(NATIVE_TARGETS))
build: select
	ocamlbuild $(TARGETS)

clean:
	rm src/seq.ml src/seq.mli || true
	ocamlbuild -clean

TOINSTALL=$(wildcard _build/src/*)

install:
	ocamlfind install seq META $(TOINSTALL)

.PHONY: build clean install
