all: gen/plot_all.pdf gen/plot_Antwerp.pdf

gen/plot_all.pdf: gen/aggregated_df.csv src/PlotAll.R
	R --vanilla < src/PlotAll.R

gen/plot_Antwerp.pdf: gen/Pivot_table.csv src/PlotAntwerp.R
	R --vanilla < src/PlotAntwerp.R

gen/Pivot_table.csv: gen/aggregated_df.csv src/Pivot.R
	R --vanilla < src/Pivot.R

gen/aggregated_df.csv: gen/listings.csv gen/reviews.csv src/Clean.R
	R --vanilla < src/Clean.R

gen/listings.csv gen/reviews.csv: src/Download.R
	R --vanilla < src/Download.R

clean:
	R -e "unlink(list.files(pattern='*.pdf', recursive=T))"
	R -e "unlink(list.files(pattern='*.csv', recursive=T))"


