
#
# Global Settings
#

INSTALL = install
DESTDIR ?= /
PREFIX  ?= $(DESTDIR)/usr

PATH_EXEC = $(PREFIX)/bin/url-handler
PATH_EXEC_DESKTOP = $(PREFIX)/share/applications/url-handler.desktop
#
# Targets
#

all:
	@echo "Nothing to do"

install:
	$(INSTALL) -m0644 -D src/url-handler.desktop $(PATH_EXEC_DESKTOP)
	$(INSTALL) -m0755 -D src/url-handler $(PATH_EXEC)
	xdg-mime default url-handler.desktop x-scheme-handler/http
	xdg-mime default url-handler.desktop x-scheme-handler/https
	# xdg-settings set default-url-scheme-handler http url-handler.desktop

uninstall:
	rm -f $(PATH_EXEC)
	rm -f $(PATH_EXEC_DESKTOP)


.PHONY: all install uninstall
