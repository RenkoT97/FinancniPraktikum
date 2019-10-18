library(readr)
library(dplyr)

tabela1 <- read.csv("https://raw.githubusercontent.com/RenkoT97/FinancniPraktikum/master/hist_EURIBOR_2010.csv", stringsAsFactors=FALSE)
tabela2 <- read.csv("https://raw.githubusercontent.com/RenkoT97/FinancniPraktikum/master/hist_EURIBOR_2011.csv", stringsAsFactors=FALSE)
tabela3 <- read.csv("https://raw.githubusercontent.com/RenkoT97/FinancniPraktikum/master/hist_EURIBOR_2012.csv", stringsAsFactors=FALSE)

#tabela1 <- read.csv("hist_EURIBOR_2010.csv")
tabela1 <- t(tabela1)
tabela1 <- tabela1[,c(4:15)]
colnames(tabela1) <- tabela1[1,]
tabela1 <- tabela1[-1, ]
tabela1 <- tabela1[c(1,21,41,64,86,107,129,151,173,195,216,238),]

#tabela2 <- read.csv("hist_EURIBOR_2011.csv")
tabela2 <- t(tabela2)
tabela2 <- tabela2[,c(4:15)]
colnames(tabela2) <- tabela2[1,]
tabela2 <- tabela2[-1, ]
tabela2 <- tabela2[c(1,22,42,65,84,106,128,149,172,194,215,237),]

#tabela3 <- read.csv("hist_EURIBOR_2012.csv")
tabela3 <- t(tabela3)
tabela3 <- tabela3[,c(4:15)]
colnames(tabela3) <- tabela3[1,]
tabela3 <- tabela3[-1, ]
tabela3 <- tabela3[c(1,23,44,66,85,107,128,150,173,193,216,238),]

tabela <- rbind(tabela1,tabela2)
tabela <- rbind(tabela,tabela3)
tabelaLTU <- tabela[,c(6,12)]
colnames(tabelaLTU) <- c("polletna", "enoletna")
U<-12
T<-6
n<-36
tabelaLTU[,1] <- as.numeric(tabelaLTU[,1])
tabelaLTU[,2] <- as.numeric(tabelaLTU[,2])

tabelaLTU <- as.numeric(tabelaLTU)
sapply(tabelaLTU, class)

terminskeobrestnemere <- rep(1,n)/(U-T)*((rep(1,n)+U*(tabelaLTU[,2]))/(rep(1,n)+T*(tabelaLTU[,1]))-rep(1,n))



#ts.plot(tabelaLTU, xlab="meseci", ylab="obrestne mere")

# U teèe od 12. meseca do konca, T teèe od šestega do tridesetega meseca
# L(0,T,U) je danes dogovorjena obrestna mera za transakcijo, ki se priène v èasu T in konèa v èasu U.
#Graf: L(0,T,U) = L(0,6,12)
