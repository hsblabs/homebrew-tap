TAP_REPOSITORY := hsblabs/homebrew-tap
TAP_NAME := hsblabs/tap

test:
	@repo="$$(brew --repository)"; \
	tapdir="$$repo/Library/Taps/$(TAP_REPOSITORY)"; \
	mkdir -p "$$(dirname "$$tapdir")"; \
	ln -sfn "$$(pwd)" "$$tapdir"; \
	trap 'rm -f "$$tapdir"' EXIT; \
	for formula in Formula/*.rb; do \
		name="$$(basename "$$formula" .rb)"; \
		HOMEBREW_NO_AUTO_UPDATE=1 brew audit --strict --online "$(TAP_NAME)/$$name"; \
		HOMEBREW_NO_AUTO_UPDATE=1 brew install --formula "$(TAP_NAME)/$$name"; \
		HOMEBREW_NO_AUTO_UPDATE=1 brew test "$(TAP_NAME)/$$name"; \
	done

update:
	maltmill -w $$(find Formula -name '*.rb' -type f)

.PHONY: test update
