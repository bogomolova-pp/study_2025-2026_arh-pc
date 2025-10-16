FILES = $(patsubst %.md, %.docx, $(wildcard *.md))
FILES += $(patsubst %.md, %.pdf, $(wildcard *.md))

FILTERS =
OPTIONS += --number-sections
PDF_ENGINE += --pdf-engine=xelatex --pdf-engine-opt=--shell-escape
PDF_OPTIONS += --variable=mainfont:"Liberation Serif"
BIB_OPTIONS = --citeproc
PDF_BIB_OPTIONS = --citeproc
FORMAT_OPTIONS =

%.docx: %.md
	-pandoc "$<" $(FILTERS) $(OPTIONS) $(BIB_OPTIONS) -o "$@"

%.pdf: %.md
	-pandoc "$<" $(FILTERS) $(PDF_ENGINE) $(PDF_OPTIONS) $(PDF_BIB_OPTIONS) $(FORMAT_OPTIONS) $(OPTIONS) -o "$@"

all: $(FILES)

clean:
	-rm -f $(FILES) *~

cleanall: clean
