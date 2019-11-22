library(actuar)

podatki <- read.delim("https://raw.githubusercontent.com/RenkoT97/FinancniPraktikum/master/vzorec2.txt", sep = "\t", dec = ".")

#unikatne_vrednosti  <- podatki 
#unique(unikatne_vrednosti, incomparables = FALSE)
#pogostost <- count(podatki, vars = unikatne_vrednosti)

visinaodskodnine <- as.vector(podatki$X2.297061)
histogram_odskodnin <- hist(visinaodskodnine, freq = TRUE, main = "Histogram odškodnin")

pribliznaporazdelitev <- mde(visinaodskodnine, pexp, start = list(rate = 1/200))
lambda = estimate(pribliznaporazdelitev)
lambda = 3 #dobi iz ocene? kaj je ocena?
gostota_eksponentne <- function(x) {lambda * exp(((-1) * lambda * x))}
#kako dodaš krivuljo histogramu? ne s plusom
histogram_odskodnin_in_eksponentna <- histogram_odskodnin #
histogram_odskodnin_in_eksponentna
curve(gostota_eksponentne, 0, 7, n = 1000)

velikost = 25
verjetnost = 1/2

#Bin(p) za n



'''
par(mfrow=c(2,2))
curve(x^3-3*x, -2, 2)
curve(x^2-2, add = TRUE, col = "violet")
curve(sin, -pi, 3*pi)
plot(cos)
chippy <- function(x) sin(cos(x)*exp(-x/2))
curve(chippy, -8, 7, n=2001)
for(ll in c("","x","y","xy"))
  curve(log(1+x), 1,100, log=ll, sub=paste("log=",ll))
#3c ni treba!!!!!!!!!!!!!