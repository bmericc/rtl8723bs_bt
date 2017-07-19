CC := cc
PREFIX :=
FW_DIR	:= $(PREFIX)/lib/firmware/rtl_bt

rtk_hciattach:hciattach.c hciattach_rtk.o
	$(CC) -o rtk_hciattach hciattach.c hciattach_rtk.o

hciattach_rtk.o:hciattach_rtk.c
	$(CC) -c hciattach_rtk.c

clean:
	rm -f *.o  rtk_hciattach

install:
	mkdir -p $(FW_DIR)
	mkdir -p $(PREFIX)/sbin
        cp -p firmware/rtlbt_* $(FW_DIR)/.
	cp -p rtk_hciattach $(PREFIX)/sbin/
	cp -p scripts/start-rtl-bluetooth $(PREFIX)/sbin/

uninstall:
	rm -f $(FW_DIR)/rtlbt_*
	rm -f $(PREFIX)/sbin/rtk_hciattach
	rm -f $(PREFIX)/sbin/start-rtl-bluetooth
