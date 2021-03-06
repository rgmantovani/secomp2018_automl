# MLR installation
DEV = TRUE

if (DEV){
    # Install the development version
    install.packages("devtools")
    devtools::install_github("mlr-org/mlr")
} else {
    # Install the CRAN version
    install.packages('mlr')
}

# OpenML installation
install.packages("OpenML")
install.packages("farff")

# plot
install.packages('ggplot2')

#CD
install.packages('PMCMR')

# parallel processing
install.packages('parallelMap')

# feature selection
install.packages("FSelector")

# mlrMBO
install.packages("mlrMBO")

# emoa
install.packages("emoa")
