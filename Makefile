###========================================================================
### File: Makefile
###
### Author(s):
###   - Enrique Fernandez <efcasado(at)gmail.com>
###========================================================================

##== Preamble =============================================================
.PHONY: deps compile test

define mix
@docker run --rm \
-v $(CURDIR):/code \
-w /code \
-e MIX_ENV \
-e HEX_HOME=/code \
-e MIX_HOME=/code \
efcasado/elixir:1.3 \
mix $1
endef


##== Targets ==============================================================
deps:
	$(call mix, local.hex --force)
	$(call mix, deps.get)
	$(call mix, deps.compile)

compile:
	$(call mix, compile)

test:
	$(call mix, test)
