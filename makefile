all: clean

run_install_package:
	Rscript install_packages.R

download: run_install_package
	make -C src/download
	
derived: download
	make -C src/derived
	
markdown: derived
	Rscript -e "rmarkdown::render('src/data-analysis/analysis.Rmd', output_file='../../gen/analysis.pdf')"

clean: markdown
	make -C src/cleaning

