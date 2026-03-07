.PHONY: switch
switch:
	nixos-rebuild switch --sudo --flake .

.PHONY: clean
clean:
	nix-collect-garbage -d
	rm -rf result
