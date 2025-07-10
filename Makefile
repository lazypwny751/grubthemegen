VERSION := 0.1.0
NAME := grubthemegen
FILE := $(NAME)-$(VERSION).gem

all: gem install
gem:
	gem build $(NAME).gemspec
install:
	sudo gem install $(FILE)
clean:
	rm -rf $(NAME)-*.gem

.PHONY: all gem install push clean
