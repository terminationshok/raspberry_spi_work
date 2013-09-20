#
# Makefile:
# For command line to LED SPI interface app named spi_led_spit
#
#################################################################################
# Compile a piece of C code using the wiringPi library:
# sudo cc -o fun softPwm.c -I/usr/local/include -L/usr/local/lib -lwiringPi -lpthread
#################################################################################

TRANSFER=scp
REXEC=ssh
SSHFLAGS=-C # Compress data
REMOTE=pi@192.168.1.178:~/src/spi_work/v2/
FILES=socket_server.ct Makefile.buildt

###############################################################################

SRC	=	socket_server.c

OBJ	=	socket_server.o

BINS	=	socket_server

%.ht : %.h
	$(TRANSFER) $(SSHFLAGS) $< $(REMOTE)

%.ct : %.c
	$(TRANSFER) $(SSHFLAGS) $< $(REMOTE)

%.jst : %.js
	$(TRANSFER) $(SSHFLAGS) $< $(REMOTE)
	
%.buildt : %.build
	$(TRANSFER) $(SSHFLAGS) $< $(REMOTE)

all-done: $(FILES)
	$(REXEC) $(SSHFLAGS) pi@192.168.1.178 "cd ~/src/spi_work/v2/ && make"
