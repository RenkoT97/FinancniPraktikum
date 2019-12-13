library(dplyr)
library(ggplot2)

platina <- read.csv("platina19.csv", stringsAsFactors = FALSE)
platina %>%  View

zadnjih6mesecev <- head(platina, 89)
zadnjih6mesecev <- zadnjih6mesecev[seq(from = 89, to = 1, by = -1),]
zadnjih6mesecev <- sapply(zadnjih6mesecev,function(x) gsub("\\$","",x))
zadnjih6mesecev %>% View

graf1 <- ggplot(data.frame())+ aes(x = seq(from = 1, to = 89), y = zadnjih6mesecev[,2]) +
   geom_point() + geom_line()

G <- function(vrsta, k) {
  T <- length(vrsta)
  vek <- seq(k,T)
  zglajenevrednosti <- c()
  for (v in vek)
  {
    vsota <- sum(vrsta[(v-1) : (v-k)])
    zglajenevrednosti <- c(zglajenevrednosti, (vsota / k))
  }
  return(zglajenevrednosti)
}

g <- c(G(as.numeric(zadnjih6mesecev[,2]), 7))
graf2 <- ggplot(data.frame()) + aes(x = seq(1,83), y = g) +
  geom_line()
