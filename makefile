all:app

INC := -Iinclude
headers := $(wildcard include/*.h)

src/app.cc: $(headers)
libx/x.cc: $(headers)

libx/x.o: libx/x.cc
	g++ -g -O0 $(INC) -c -o $@ $^

libx-d.so: libx/x.o
	g++ -shared -o $@ $^

libx-r.so: libx-d.so
	objcopy --strip-debug $< $@

src/app.o: src/app.cc
	g++ -g -O0 $(INC) -c -o $@ $^

#### libx.so must be placed last
app: src/app.o libx-r.so
	g++ -g -O0 -o $@ $^

test: app
	LD_LIBRARY_PATH=$(shell pwd) ./app

clean:
	find . -name "*.o" | xargs rm -rf
	rm -rf libx*.so app
