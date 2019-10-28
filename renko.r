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

U<-12
T<-6
n<-36

tabela <- rbind(tabela1,tabela2)
tabela <- rbind(tabela,tabela3)

tab1c <- tabela[,c(6,12)]
colnames(tab1c) <- c("L(0,6)","L(0,12)")
grafc1 <- ts.plot(tab1c,
                  gpars = list(xlab="meseci", ylab="obrestne mere", lty = c(1:3)))
legend("topright", colnames(tab1c), lty = c(1:3))

#Izbrani datumi: 01.04.2010, 01.07.2011, 01.08.2012
#Vse obrestne mere narašèajo konkavno, a skoraj linearno

tab2a <- tabela[c("X01.04.2010", "X01.07.2011", "X01.08.2012"),]
tab2a <- t(tab2a)
colnames(tab2a) <- c("01.04.2010", "01.07.2011", "01.08.2012")
graf2a <- ts.plot(tab2a,
                  gpars = list(xlab = "meseci", ylab = "obrestne mere", lty = c(1:3)))
legend("topright",colnames(tab2a), lty = c(1:3))

''' 
tabelaLTU <- tabela[,c(6,12)]
tabelaLTU <- as.numeric(tabelaLTU)
sapply(tabelaLTU, class)

polletna <- tabelaLTU[1:n]
enoletna <- tail(tabelaLTU,n)

terminskeobrestnemere <- rep(1,n)/(U-T)*((rep(1,n)+U*(enoletna))/(rep(1,n)+T*(polletna))-rep(1,n))
'''