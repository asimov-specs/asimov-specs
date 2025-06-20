YQ = yq

all: biblio.json

biblio.json: biblio.yaml
	$(YQ) -p yaml -o json < $< > $@
