#################################################################
# Dockerfile
#
# Version:          1
# Software:         R
# Description:      R and necessary packages for the analysis of Affymetrix microarrays
# Website:          
# Tags:             None, for the moment
# Base Image:       R
#################################################################

#R image to be the base in order to build our new image
FROM r-base:3.4.0

#Install Bioconductor packages first
RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite(pkgs=c("sva","Biobase","limma", "BiocGenerics","affxparser","affy", "affyPLM", "aroma.light", "gcrma", "oligo", "oligoClasses", "pdInfoBuilder", "preprocessCore", "AffymetrixDataTestFiles", "DNAcopy"))'

#Install packages from CRAN
RUN Rscript -e 'install.packages(c("R.utils","aroma.affymetrix","data.table", "gtools", "Rcpp","RColorBrewer", "gplots","scatterplot3d"))'

#Vennerable has to be installed from a website repo
RUN Rscript -e 'install.packages("Vennerable", repos="http://R-Forge.R-project.org")'

#Define the user in order to be the oxner of the created files
USER 10008:9001
