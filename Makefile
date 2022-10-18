all: tt
	
tt: tt.swift
	swiftc -o tt tt.swift

clean:
	rm tt
