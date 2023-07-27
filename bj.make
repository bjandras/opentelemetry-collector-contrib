.PHONY: genotelbjcol
genotelbjcol: $(BUILDER)
	$(BUILDER) --skip-compilation --config cmd/otelbjcol/builder-config.yaml --output-path cmd/otelbjcol
	$(MAKE) -C cmd/otelbjcol fmt

.PHONY: otelbjcol
otelbjcol:
	cd ./cmd/otelbjcol && GO111MODULE=on CGO_ENABLED=0 $(GOCMD) build -trimpath -o ../../bin/otelbjcol_$(GOOS)_$(GOARCH)$(EXTENSION) \
		$(BUILD_INFO) -tags $(GO_BUILD_TAGS) .

