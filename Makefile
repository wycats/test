all: ext/foo.bundle
	ruby foo.rb

ext/libfoo.a: foo.rs
	rustc foo.rs --out-dir ext

ext/Makefile: ext/extconf.rb ext/libfoo.a
	cd ext && ruby extconf.rb

ext/foo.bundle: ext/Makefile ext/foo.c ext/libfoo.a
	$(MAKE) -C ext

clean:
	[ -f ext/Makefile ] && $(MAKE) -C ext distclean || exit 0
	rm -f ext/libfoo.a
