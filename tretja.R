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
