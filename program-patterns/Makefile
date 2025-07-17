MMDC = mmdc

all: diagrams

diagrams: $(patsubst diagrams/%.mmd,img/%.mmd.svg, $(wildcard diagrams/*.mmd))

img/%.mmd.svg: diagrams/%.mmd
	$(MMDC) -i $< -o $@ --backgroundColor black --configFile mermaid.json
