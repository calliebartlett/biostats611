.PHONY: clean
.PHONY: init

init:
	mkdir -p derived_data
	mkdir -p figures
	mkdir -p scripts
	
clean:
	rm -rf derived_data
	rm -rf figures
	rm -f report.html 

all: init derived_data/2019clean_data.csv figures/happiness_score_by_country.png figures/economy_vs_happiness.png figures/happiness_distribution.png figures/correlation_heatmap.png figures/social_support_boxplot.png report.html

report.html: report.Rmd ./figures/happiness_score_by_country.png ./figures/economy_vs_happiness.png ./figures/correlation_heatmap.png ./figures/happiness_distribution.png ./figures/social_support_boxplot.png
	R -e "rmarkdown::render ('report.Rmd', output_format = 'html_document')"

./derived_data/2019clean_data.csv: 2019.csv scripts/clean_data.R
	Rscript scripts/clean_data.R

./figures/happiness_score_by_country.png: derived_data/2019clean_data.csv scripts/happiness_score_country.R
	Rscript scripts/happiness_score_country.R

./figures/economy_vs_happiness.png: derived_data/2019clean_data.csv scripts/economy_happiness.R
	Rscript scripts/economy_happiness.R 

./figures/correlation_heatmap.png: derived_data/2019clean_data.csv scripts/correlation_heatmap.R
	Rscript scripts/correlation_heatmap.R

./figures/happiness_distribution.png: derived_data/2019clean_data.csv scripts/happiness_distribution.R
	Rscript scripts/happiness_distribution.R

./figures/social_support_boxplot.png: derived_data/2019clean_data.csv scripts/social_support.R
	Rscript scripts/social_support.R 