
UNAME := $(shell uname)

NIXNAME := $(shell scutil --get LocalHostName)

switch:
	nix build --extra-experimental-features nix-command --extra-experimental-features flakes ".#darwinConfigurations.${NIXNAME}.system"
	./result/sw/bin/darwin-rebuild switch --flake "$$(pwd)#${NIXNAME}"
