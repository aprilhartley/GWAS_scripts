#==========================#
# Manhattan/QQ plot script #
#   Lavinia Paternoster    #
#        16.07.2015        #
#      Using R 3.0.2       #
#==========================#

# qqman requires R-3.0.0
# on bluecrystal p4: module load languages/r/4.1.0
# install.packages(qqman)

library(qqman)

results=read.table("results_file.txt", header=TRUE)

# have a look at the data
str(results)
head(results)

SNP <- results$rsID
CHR <- results$chromosome
BP <- results$position
P <- results$p.value
DATA <- data.frame(SNP, CHR, BP, P)

tiff("my_manhattan_plot.tif")
manhattan(DATA, p="P", chr="CHR", bp="BP", snp="SNP", ylim=c(0, 20))
dev.off()
args(manhattan) # see what arguements you can give to manhattan command and try a custom plot

tiff("my_qqplot.tif")
qq(P)
dev.off()
