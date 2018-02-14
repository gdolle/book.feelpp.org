HELP="Usage: make <option> \n\
\nOptions:\n\
\n\
\tinstall - install gem files (first time, bundler required) \n\
\tbuild   - build the book \n\
\tserve   - run a local web server (open localhost:4000 in the webbrowser) \n\
\tantora  - compile the antora documentation (experimental) \n\
\tclean   - clean gem lock file (redo install after) \n\
\thelp    - print this help\n\n"


all: help

install:
	bundle install --path .bundle/gems

build:
	#asciidoctor -a reproducible -S unsafe -a allow-uri-read README.adoc
	bundle exec jekyll build

serve:
	bundle exec jekyll serve


install-antora:
	mkdir -p build
	cd build; \
	npm init -y; \
	npm install --save . @antora/cli; \
	npm install --save . @antora/site-generator-default
	cp antora/* build

antora:
	cd build_antora
	antora feelpp-doc.yml

clean:
	rm -rf Gemfile.lock
	rm -rf .bundle/gems

help:
	@printf ${HELP}
