FROM rocker/r-base

LABEL maintainer "Arnfinn Hykkerud Steindal <arnfinn.steindal@gmail.com>"

# system libraries of general use
RUN apt-get update && apt-get install -y \
    libudunits2-dev \
    libprotobuf-dev \
    libv8-dev \
    libjq-dev \
    protobuf-compiler \
    libgdal-dev

# basic R functionality
RUN R -e "install.packages(c('remotes'), repos='https://cloud.r-project.org/')"

# install package dependencies
RUN R -e "install.packages(c('shiny', 'shinythemes', 'shinyWidgets', 'shinyalert', 'rsconnect', 'ggplot2', 'leaflet', 'magrittr', 'dplyr', 'ggthemes', 'classInt', 'yaml', 'sf'))"

RUN R -e "remotes::install_github('SKDE-Felles/SKDEr')"

CMD ["R"]
