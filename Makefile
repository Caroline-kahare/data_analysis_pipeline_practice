# Makefile for the data analysis pipeline

# Define variables for paths to scripts and input/output files
WORDCOUNT_SCRIPT=scripts/wordcount.py
PLOTCOUNT_SCRIPT=scripts/plotcount.py
INPUT_FILES=data/isles.txt data/abyss.txt data/last.txt data/sierra.txt
OUTPUT_FILES=results/isles.dat results/abyss.dat results/last.dat results/sierra.dat
PLOT_FILES=results/figure/isles.png results/figure/abyss.png results/figure/last.png results/figure/sierra.png

# Default target
all: $(OUTPUT_FILES) $(PLOT_FILES)

# Rule for generating word count files
results/isles.dat: data/isles.txt
	python $(WORDCOUNT_SCRIPT) --input_file=data/isles.txt --output_file=results/isles.dat
results/abyss.dat: data/abyss.txt
	python $(WORDCOUNT_SCRIPT) --input_file=data/abyss.txt --output_file=results/abyss.dat
results/last.dat: data/last.txt
	python $(WORDCOUNT_SCRIPT) --input_file=data/last.txt --output_file=results/last.dat
results/sierra.dat: data/sierra.txt
	python $(WORDCOUNT_SCRIPT) --input_file=data/sierra.txt --output_file=results/sierra.dat

# Rule for generating plot files
results/figure/isles.png: results/isles.dat
	python $(PLOTCOUNT_SCRIPT) --input_file=results/isles.dat --output_file=results/figure/isles.png
results/figure/abyss.png: results/abyss.dat
	python $(PLOTCOUNT_SCRIPT) --input_file=results/abyss.dat --output_file=results/figure/abyss.png
results/figure/last.png: results/last.dat
	python $(PLOTCOUNT_SCRIPT) --input_file=results/last.dat --output_file=results/figure/last.png
results/figure/sierra.png: results/sierra.dat
	python $(PLOTCOUNT_SCRIPT) --input_file=results/sierra.dat --output_file=results/figure/sierra.png

# Rule for cleaning up generated files
clean:
	rm -f results/*.dat results/figure/*.png


