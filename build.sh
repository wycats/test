rustc foo.rs --crate-type=dylib
ruby ext/extconf.rb
make
ruby foo.rb
