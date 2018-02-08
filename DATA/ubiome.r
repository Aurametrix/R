library(jsonlite)
UBIOME_DATADIR <- Sys.getenv("UBIOME_DATADIR")
myJSON <- jsonlite::read_json(paste0(UBIOME_DATADIR),"/richard_sprague/richard_sprague-2017-01-01-gut-123456.json")

library("actino")
library(phyloseq)
plot_bar(prune_taxa(taxa_sums(kombucha.genus)>100000,kombucha.genus), fill = "Genus")

experiment_to_phyloseq("myCSVfile.csv",mapfile)

phyloseq_from_JSON_at_rank("myJSONfile.json",mapfile,rank="genus")

library(actino)
library(phyloseq)
data("kombucha.csv")
head(kombucha.csv)

kombucha <- kombucha.csv  # simplify the name to make it easier to type
kombucha$ssr <- 1234 # I gave this sample the arbitrary ssr '1234'.
ssrs <- unique(kombucha$ssr)

ssrs

mapfile<-data.frame(ssr=ssrs,date = Sys.Date()+seq(1,length(ssrs)), color = colors()[1:length(ssrs)])

mapfile

kombucha.gut <- subset_samples(kombucha.genus, Site == "gut") # just the gut samples

plot_heatmap(prune_taxa(taxa_sums(kombucha.gut)>10000,kombucha.gut),method = "CCA", distance = "none", sample.order = "Date", sample.label = "Date")

head(get_taxa_unique(kombucha.ps, taxonomic.rank = "Genus"),10) # which are the unique taxa at Genus level?

#Note: if our data included other tax_ranks, we could have specified that.

ntaxa(kombucha.ps) # how many unique taxa were in the sample?

names(sort(taxa_sums(kombucha.ps),TRUE)[1:10]) # the ten most common genera

sample_data(subset_samples(kombucha.genus,grepl("[P|p]otato",sample_data(kombucha.genus)$Notes)))[,c("Date","Label")]
