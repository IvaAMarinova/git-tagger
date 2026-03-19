.PHONY: install uninstall reinstall help

install:
	@chmod +x install.sh uninstall.sh tagger
	@echo "Installing tagger..."
	@./install.sh

uninstall:
	@echo "Uninstalling tagger..."
	@./uninstall.sh

reinstall: uninstall install

help:
	@echo "Available commands:"
	@echo "  make install     -> install tagger globally"
	@echo "  make uninstall   -> remove tagger"
	@echo "  make reinstall   -> reinstall tagger"
	@echo "  make help        -> show this message"