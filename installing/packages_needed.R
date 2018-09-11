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
