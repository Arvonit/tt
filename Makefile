all: tt 
	
tt: tt.swift | build
	swiftc -o build/tt tt.swift

build:
	mkdir -p $@

clean:
	$(RM) -rv build

install: build/tt
	cp $< ~/.local/bin/tt
