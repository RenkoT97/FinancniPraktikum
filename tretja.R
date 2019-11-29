S0 <- 50
u <- 1.5
d <- 0.95
R <- 3/100
T <- 3

izplacilo <- function(vrsta, T, type) {
  if (type == "call"){
    STK <- max(tail(vrsta, T))-max(vrsta[1:(T)])
    return(max(STK, 0))
    } else{
    KST <- min(tail(vrsta, T))-min(vrsta[1:(T)])
    return(max(KST, 0))
    }
  }

tabela1 <- data.frame(t(data.frame(c(50.00, 52.50, 49.88, 52.37, 49.75, 52.24),
c(50.00, 52.50, 55.12, 57.88, 60.78, 63.81),
c(50.00, 47.50, 49.88, 47.38, 45.01, 42.76),
c(50.00, 47.50, 45.12, 47.38, 49.75, 52.24),
c(50.00, 52.50, 49.88, 52.37, 54.99, 57.74))))

izplacilocall <- function(vrsta) {
  return(max(max(tail(vrsta, 3))-max(vrsta[1:(3)]), 0))
}

izplaciloput <- function(vrsta) {
  return(max(min(tail(vrsta, 3))-min(vrsta[1:(3)]), 0))
}

tabela1$izplaciloX <- apply(tabela1[1:6], MARGIN = 1, FUN = izplacilocall)

tabela1$izplaciloY <- apply(tabela1[1:6], MARGIN = 1, FUN = izplaciloput)

binomski <- function(S0,u,d,U,R,T,type) {
  q = (1+R-d)/(u-d)
  matrika <- hcube(rep(2, U), translation = -1)
  Q = q^(rowSums(matrika)) * (1 - q)^(U - rowSums(matrika))
  nova <- u^matrika * d^(1-matrika)
  vektor <- rep(S0, 2^U)
  dodanvek <- cbind(vektor, nova)
  zmnozena <- t(apply(dodanvek, 1, cumprod))
  izplacila <- apply(zmnozena, 1, izplacilo, T, type)
  return(sum(izplacila * Q) / (1 + R)^U)
}

monte <- function(S0,u,d,U,R,T,type,N) {
  
}

S0 = 60
u = 1.05
d = 0.95
U = 15
R = 1/100
T = 8
type = "put"
N1 = 10
N2 = 100
N3 = 1000

monte(S0,u,d,U,R,T,type,N1)
monte(S0,u,d,U,R,T,type,N2)
monte(S0,u,d,U,R,T,type,N3)