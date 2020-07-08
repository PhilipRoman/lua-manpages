.POSIX:
.SUFFIXES:

.PHONY: all install uninstall

all: $(shell for x in *.adoc; do echo build/`basename "$$x" .adoc`.3lua; done)

build/%.3lua: %.adoc
	@mkdir -p build/
	asciidoctor -b manpage -D build $<

install: all
	cp -v build/*.3lua /usr/local/share/man/man3/
	@echo
	@echo  =============================================================
	@echo 'Consider adding "3lua" to $$MANSECT (see /etc/manpath.config)'
	@echo  =============================================================
