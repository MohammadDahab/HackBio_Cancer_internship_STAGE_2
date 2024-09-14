# **HackBio_Cancer_internship_STAGE_Two_Task**
## **Gene Expression Analysis and Functional Enrichment Interpretation**
## **Authors (@slack): Mohammed Dahab (@m_dahab7), Aya Elhagry (@AyaElhagry) Nourhan Mahmoud (@NourhanM1), Alaa Khaled (@Alaa043), Marwan Magdy(@Marwan16)**
`THE SOURCE CODE` [Codebase link](https://github.com/MohammadDahab/HackBio_Cancer_internship_STAGE_2/blob/main/Stage_2_task.R)

Our objective was to visualize and explain a gene expression dataset by employing heatmaps and conducting functional enrichment analysis using the **glioblastoma** [dataset](https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/Cancer2024/glioblastoma.csv).
## **1. Heatmap Presentation**
We utilized the **heatmap.2** function from the **gplots** package in **R** to create two types of heatmaps for displaying the gene expression data. The heatmaps were generated using **diverging** and **sequential** color palettes to aid in understanding expression patterns:

•             We used the diverging palette (**RdBu**) to highlight the contrast between high and low expression values, which is particularly beneficial for identifying highly upregulated or downregulated genes.

•             The sequential palette (**Blues**) was employed to emphasize gradual expression changes, making it suitable for highlighting subtle differences across the dataset.

Divergent-Palette ![div-palette](https://github.com/user-attachments/assets/9a12e260-1993-4b49-8f24-e606bfb9dbc5)

Sequential-Palette ![seq-palette](https://github.com/user-attachments/assets/1c2107a9-379c-4df0-b8be-7d2119b241d1)



The dataset comprised 10 samples: based on the heatmap clustering, we categorized the first **5 samples** as control and the remaining **5 as tumors**. This categorization allowed us to focus on differentially expressed genes under these two conditions.

Additionally, we created multiple variants of the heatmap:

•             Clustering by genes only: This enabled us to focus on similarities and patterns in gene expression. 

![div-Row-clust](https://github.com/user-attachments/assets/2d36320e-0e04-45bb-8079-46eacdd7699c)    ![seq-Row-clust](https://github.com/user-attachments/assets/52722416-73e0-4283-8c71-d437ec9e0b91)


•             Clustering by samples only: Grouping similar samples provided insights into the relationship between experimental conditions.

![div-Col-clust](https://github.com/user-attachments/assets/6d5bb27d-fe9a-4fed-8ec1-2f28b2cd49f7)    ![seq-Col-clust](https://github.com/user-attachments/assets/a43e6b39-b500-476f-a2cb-6c933050b732)

•             Clustering of both genes and samples: This combined clustering provided a comprehensive view of the entire dataset's structure.

![div-both-clust](https://github.com/user-attachments/assets/801a6c97-9599-4158-a459-093b0816f17d)    ![seq-both-clust](https://github.com/user-attachments/assets/33ffecaa-58ca-4ac3-8187-d0a0837fd811)


### **subset the significant genes:**
Genes were filtered for significant **upregulation** and **downregulation** using custom thresholds for **fold change (1)** and **p-values (0.3)**.

## **2\. Functional Enrichment Analysis**

We utilized the **ShinyGO** tool to conduct functional enrichment analysis on the differentially expressed genes. To visualize the results, we used a **lollipop** plot to display the **top 5 pathways** based on the number of associated genes and their statistical significance (-log10(p-value)). This plot presented a clear and intuitive representation of both the number of genes involved in each pathway and their level of significance.

#### **The lollipop plot** effectively conveyed both the number of genes associated with each pathway and their significance, with the lengths of the lines and the size of the dots providing a visual comparison of pathway enrichment.

The lollipop-plot

![lollipop_plot_enrichment](https://github.com/user-attachments/assets/41b9d5c4-6d96-418c-a856-d49d53d373f0)


### **Among the top 3 enriched pathways were:**

**1. Cytokine-cytokine receptor interaction Path:**

This pathway is integral to immune cell communication and regulation. Cytokines, which are small signaling proteins released by cells, play a specific role in cell interactions and communication. Dysregulation of cytokine-cytokine receptor interactions is commonly associated with inflammatory diseases and cancers, including glioblastoma. Overexpression of certain cytokines can contribute to tumor growth, immune evasion, and chronic inflammation within the tumor microenvironment.

**2. Viral protein interaction with cytokine and cytokine receptor Path:**

This pathway highlights the interaction between viral proteins and host cytokine signaling mechanisms. Viruses often exploit host immune signaling pathways to either enhance their replication or suppress immune responses. In glioblastoma, similar mechanisms of immune suppression and manipulation of cytokine signaling can be observed, as cancer cells may hijack this pathway to promote tumor progression and avoid immune detection.

**3. IL-17 signaling pathway Path:**

The IL-17 signaling pathway plays a crucial role in inflammation and immune responses. IL-17, a pro-inflammatory cytokine produced by a subset of T-helper cells, is particularly important in mediating responses to bacterial and fungal infections. In the context of cancer, particularly glioblastoma, aberrant activation of the IL-17 pathway has been associated with tumor-promoting inflammation, facilitating tumor growth, and creating a microenvironment supportive of cancer cell survival.
