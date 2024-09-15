# **HackBio_Cancer_internship_STAGE_Two_Task**
## **Gene Expression Analysis and Functional Enrichment Interpretation** 

**(Machine Learning/Data Science & Biomarkers Team)**
## **Authors (@slack): Mohammed Dahab (@mdahab7), Aya Elhagry (@AyaElhagry) Nourhan Mahmoud (@NourhanM1), Alaa Khaled (@Alaa043), Marwan Magdy(@Marwan16)**

### `THE SOURCE CODE` [Codebase link](https://github.com/MohammadDahab/HackBio_Cancer_internship_STAGE_2/blob/main/Stage_2_task.R)

### for more supplementary data [Repository Link](https://github.com/MohammadDahab/HackBio_Cancer_internship_STAGE_2/tree/main)

### Our objective was to visualize and explain a gene expression dataset by employing heatmaps and conducting functional enrichment analysis using the **glioblastoma** [dataset](https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/Cancer2024/glioblastoma.csv).
## **1. Heatmap Presentation**
We utilized the **heatmap.2** function from the **gplots** package in **R** to create two types of heatmaps for displaying the gene expression data. The heatmaps were generated using **diverging** and **sequential** color palettes:

•             We used the diverging palette (**RdBu**) to highlight the contrast between high and low expression values.

•             The sequential palette (**Blues**) was employed to emphasize gradual expression change.

### Divergent-Palette

![div-palette](https://github.com/user-attachments/assets/9a12e260-1993-4b49-8f24-e606bfb9dbc5)

### Sequential-Palette

![seq-palette](https://github.com/user-attachments/assets/1c2107a9-379c-4df0-b8be-7d2119b241d1)



### Clustering by genes only focuses on similarities and gene expression patterns. 

![div-Row-clust](https://github.com/user-attachments/assets/2d36320e-0e04-45bb-8079-46eacdd7699c)    ![seq-Row-clust](https://github.com/user-attachments/assets/52722416-73e0-4283-8c71-d437ec9e0b91)


### Clustering by samples only, grouping similar samples provided the relationship between conditions.

![div-Col-clust](https://github.com/user-attachments/assets/6d5bb27d-fe9a-4fed-8ec1-2f28b2cd49f7)    ![seq-Col-clust](https://github.com/user-attachments/assets/a43e6b39-b500-476f-a2cb-6c933050b732)

### Clustering of genes and samples provides a comprehensive view of the dataset's structure.

![div-both-clust](https://github.com/user-attachments/assets/801a6c97-9599-4158-a459-093b0816f17d)    ![seq-both-clust](https://github.com/user-attachments/assets/33ffecaa-58ca-4ac3-8187-d0a0837fd811)

The dataset comprised 10 samples according to the heatmap **`clustering by samples`**, we categorized the first **5 samples** as a group and the remaining **5 samples**. as a second group.

### **subset the significant genes:**
Genes were filtered for significant **upregulation** and **downregulation** using custom thresholds according to the plotting for **fold change (1)** and **p-values (0.3)**.

![FC_pval_plot](https://github.com/user-attachments/assets/c6824a3b-9710-45d6-b6c6-e261aedcb282)


## **2\. Functional Enrichment Analysis**

We utilized the **ShinyGO** tool to conduct functional enrichment analysis on the differentially expressed genes. To visualize the results, we used a **lollipop** plot to display the **top 5 pathways** based on the number of associated genes and their statistical significance (-log10(p-value)). This plot presented a clear and intuitive representation of both the number of genes involved in each pathway and their level of significance.

#### **The lollipop plot** effectively conveyed both the number of genes associated with each pathway and their significance, with the lengths of the lines and the size of the dots providing a visual comparison of pathway enrichment.

The lollipop-plot

![lollipop_plot_enrichment](https://github.com/user-attachments/assets/41b9d5c4-6d96-418c-a856-d49d53d373f0)


### **Among the top 3 enriched pathways were:**

**1. Cytokine-cytokine receptor interaction Path:**

Cytokines are soluble extracellular proteins, also known as glycoproteins, that play a critical role as intercellular regulators and mobilizers of cells involved in angiogenesis, innate and adaptive inflammatory host defenses, cell growth, differentiation, death, and restoring homeostasis. These molecules link to specific receptors on target cells' cell surfaces to cause responses. By structure, cytokines can be categorized into several families, and their receptors can also be categorized.[1]

**2. Viral protein interaction with cytokine and cytokine receptor Path:**

Viruses have developed a variety of strategies to avoid immune system recognition and elimination, such as cloning and repurposing host cytokine and cytokine receptor genes. Together with a class of structurally distinct, soluble, cytokine-binding or cytokine receptor-binding proteins, viral cytokines, and cytokine receptors constitute the three primary molecular mechanisms for subversion and manipulation of the host cytokine networks, primarily in big DNA viruses. A variety of immune-related factors may be impacted by viral cytokines, cytokine receptor homologs, and other binding proteins that either stimulate or inhibit cytokine signaling.[2]

**3. IL-17 signaling pathway Path:**

A subset of cytokines called interleukin 17 (IL-17) family, which includes IL-17A-F, is important for both acute and chronic inflammatory responses. While IL-17F is mostly involved in mucosal host defense mechanisms, IL-17A, the signature cytokine of the recently described T helper 17 (TH17) cell subset, has key functions in protecting the host against external pathogens and increases inflammatory pathology in autoimmune disease. The IL-17 family of molecules transmits signals that trigger the expression of antimicrobial peptides, cytokines, and chemokines by activating downstream pathways such as NF-kappaB, MAPKs, and C/EBPs.[3]

## **References for the pathways**
1. https://www.genome.jp/entry/pathway+hsa04060 
2. https://www.genome.jp/entry/pathway+hsa04061 
3. https://www.genome.jp/entry/pathway+hsa04657 
