###Installing the packages
install.packages('gplots')
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("ggplots")

install.packages('dplyr')

library(gplots)
library(dplyr)
library(RColorBrewer)

#Reading the data into a variable form the glioblastoma dataset
glio_link <- 'https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/Cancer2024/glioblastoma.csv'
glio <- read.csv(glio_link, row.names = 1)

#divergent and sequential colors
diverging_palette <- colorRampPalette(brewer.pal(11, "RdBu"))(100) 
sequential_palette <- colorRampPalette(brewer.pal(9, "Blues"))(100)

##Generating Heatmaps

heatmap.2(as.matrix(glio), col = diverging_palette, scale = "row", trace = "none", dendrogram = "both", margins = c(10, 10), 
          main = "Heatmap with Diverging Palette")

dev.copy(png, file = "heatmap_diverging_palette.png")

dev.off()

heatmap.2(as.matrix(glio), 
          col = sequential_palette, 
          scale = "row", 
          trace = "none", 
          dendrogram = "both", 
          margins = c(10, 10), 
          main = "Heatmap with Sequential Palette")
dev.copy(png, file = "heatmap_sequential_palette.png") 

dev.off()

heatmap.2(as.matrix(glio), 
          col = sequential_palette, 
          scale = "row", 
          trace = "none", 
          Rowv = TRUE, 
          Colv = "none", 
          margins = c(10, 10), 
          main = "Heatmap with Row Clustering"
)
heatmap.2(as.matrix(glio), 
          col = sequential_palette, 
          scale = "row", 
          trace = "none", 
          Rowv = "none", 
          Colv = TRUE, 
          margins = c(10, 10), 
          main = "Heatmap with Column Clustering"
)
heatmap.2(as.matrix(glio),
          col = sequential_palette,
          scale = "row",
          trace = "none",
          Rowv = TRUE, 
          Colv = TRUE, 
          margins = c(10, 10),
          main = "Heatmap with Both Row and Column Clustering")
heatmap.2(as.matrix(glio),
          col = diverging_palette,
          scale = "row",
          trace = "none",
          Rowv = TRUE, 
          Colv = "none", 
          margins = c(10, 10),
          main = "Heatmap with Diverging Colors and Row Clustering")
heatmap.2(as.matrix(glio),
          col = diverging_palette,
          scale = "row",
          trace = "none",
          Rowv = "none", 
          Colv = TRUE, 
          margins = c(10, 10),
          main = "Heatmap with Diverging Colors and Column Clustering")
heatmap.2(as.matrix(glio),
          col = diverging_palette,
          scale = "row",
          trace = "none",
          Rowv = TRUE, 
          Colv = TRUE, 
          margins = c(10, 10),
          main = "Heatmap with Diverging Colors and Both Row and Column Clustering")

##
colnames(glio)
#Grouping for fold change calc.
gp1 <- c(1,2,3,4,5)
gp2 <- c(6,7,8,9,10)

#adding data to a selected groups
gp1data <- glio[, gp1]
gp2data <- glio[, gp2]

#view

view(gp1data)

#mean calc
gp1_mean <- rowMeans(gp1data)
gp2_mean <- rowMeans(gp2data)

#view data
gp1_mean

#calc FC

fold_change <- log2(gp2_mean) - log2(gp1_mean)

fold_change

#p-value
pval <- apply(glio, 1, function(row){t.test(row[1:5], row[6:10])$p.value})

#visualise FC and -ve pval
plot(fold_change, -log10(pval))

##Assuming Cutoff

fold_change_threshold <- 1  
pvalue_threshold <- 0.3


results <- data.frame(gene = rownames(glio), FoldChange = fold_change, p_value = pval)

up_regulated <- results %>% filter(FoldChange > fold_change_threshold, p_value < pvalue_threshold)

down_regulated <- results %>% filter(FoldChange < -fold_change_threshold, p_value < pvalue_threshold)

# View the up reg

View(up_regulated)

write.csv(up_regulated, "up_reg.csv")

#view down reg

View(down_regulated)

write.csv(down_regulated, "down_reg.csv")

####then plotting the enriched data

library(ggplot2)

## Import the enrichment file with the pathways

enrich <- data.frame(nGenes = c(10, 5, 4, 5, 5, 2),

Pathway.Genes = c(294, 99, 93, 171, 191, 23),

Enrichment_FDR = c(0.000461807, 0.010750284, 0.058689577, 0.063706316, 0.081977203, 0.124866663),

Fold_Enrichment = c(6.379223821, 9.472180825, 8.066631412, 5.483894162, 4.909664406, 16.30862438),

Pathway = c("Path:hsa04060 Cytokine-cytokine receptor interaction", "Path:hsa04061 Viral protein interaction with cytokine and cytokine receptor", "Path:hsa04657 IL-17 signaling pathway", "Path:hsa05164 Influenza A", "Path:hsa04062 Chemokine signaling pathway", "Path:hsa04964 Proximal tubule bicarbonate reclamation"),

Genes = c("CSF2  EPO  CXCL8  CXCL10  LEP  PPBP  CCL28  TNFRSF17  CCL8  GDF3", "CXCL8  CXCL10  PPBP  CCL28  CCL8", "CSF2  CXCL8  CXCL10  MMP13", "TPSD1  CXCL8  CXCL10  TPSB2  TPSAB1", "CXCL8  CXCL10  PPBP  CCL28  CCL8", "AQP1  CA4"),

URL <- c("http://www.genome.jp/kegg-bin/show_pathway?hsa04060", "http://www.genome.jp/kegg-bin/show_pathway?hsa04061", "http://www.genome.jp/kegg-bin/show_pathway?hsa04657", "http://www.genome.jp/kegg-bin/show_pathway?hsa05164", "http://www.genome.jp/kegg-bin/show_pathway?hsa04062", "http://www.genome.jp/kegg-bin/show_pathway?hsa04964")
)

head(enrich)

#selecting the top 5 pathways
enrich_5 <- slice(enrich, 1:5)
View(enrich_5)

# Convert p-values to -log10(p_value) for better visualization

enrich_5$log_pval <- -log10(enrich_5$Enrichment_FDR)

# Create the lollipop plot for the pathway data

ggplot(enrich_5, aes(x = reorder(Pathway, log_pval), y = log_pval)) +
  geom_segment(aes(xend = Pathway, yend = 0), color = "gray") +
  geom_point(aes(size = Pathway.Genes), color = "blue", alpha = 0.7) +
  coord_flip() +  # Flip the axes to make it horizontal
  labs(title = "Top Pathways from Enrichment", 
       x = "Pathway", 
       y = "-log10(p-value)") +
  theme_minimal() +
  theme(legend.position = "right")

#####=====THANK YOU, I HOPE THE CODE WORKS==============
