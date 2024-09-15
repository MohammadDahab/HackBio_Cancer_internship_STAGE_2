# **This is a task of Stage Two of the HackBio cancer internship 2024**
# **Gene Expression Analysis and Functional Enrichment Interpretation**
### This repository contains R code for analyzing Gene Expression Analysis and Functional Enrichment Interpretation

## You will need to run the code

1. R programming version (4.4.1)

2. RStudio version (2024.04.2-764)

3. **Packages** `ggplots / ggplot / dplyr / RColorBrewer`

## **Useage and outputs**

Reading the online dataset from the hyperlink. 

1. Generating Heatmaps for visualization of the entire dataset using divergent and sequential color palettes
2. Grouping the samples according to heatmaps.
3. Calcutaing the log2 fold change and p-value
4. plotting the fold change and p-value to determine the cutoff
5. Differentiate the up-regulated and down-regulated genes
6. Applying Pathway enrichment analysis using [ShinyGO](http://bioinformatics.sdstate.edu/go/)
7. Selecting the top 5 pathways
8. plotting with a lollipop-plot to express the number of genes associated with each pathway and their significance

## **Supporting Files**
1. supp_data1 (folder contains all supplementary data)
2. Figures (folder contains all figures represented in the report and the code outputs)
3. Report_stage_2 (file provides detailed information about the code, interpretation, and the pathways)
