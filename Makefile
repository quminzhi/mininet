FILENAME=fat-tree.py
CONFIGURE=flow-rules.sh

.PHONY: run
run: clean
	@echo "starting to configure mininet..."
	@sudo python3 ./$(FILENAME)

.PHONY: add
add:
	@echo -n "setting up OVS links for the net..."
	@./$(CONFIGURE)
	@echo "  finished."

.PHONY: clean
clean:
	@echo -n "cleaning up cached buffer..."
	@sudo mn -c > /dev/null 2>&1
	@rm -rf logs/*
	@echo "  done."

