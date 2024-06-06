NAME      = mosquitto_auth_plugin_http

MOSQUITTO = $(HOME)/dev/mosquitto
INC       = -I. -I$(MOSQUITTO)/lib -I$(MOSQUITTO)/src -I$(MOSQUITTO)/include
CFLAGS    = -Wall -Werror -fPIC
#DEBUG     = -DMQAP_DEBUG

LIBS      = -lcurl

all: $(NAME).so

$(NAME).so: $(NAME).o
	$(CC) $(CFLAGS) $(INC) -shared $^ -o $@ $(LIBS)

%.o : %.c
	$(CC) -c $(CFLAGS) $(DEBUG) $(INC) $< -o $@

clean:
	rm -f *.o *.so

