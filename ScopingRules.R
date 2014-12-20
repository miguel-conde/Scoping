# Uso de las funciones de las slides
source("SlidesFunctions.R")

# Application: Optimization
set.seed(1); normals <- rnorm(100,1,2)
nLL <- make.NegLogLik(normals)
nLL
ls(environment(nLL))
environment(nLL)$params

# Estimating parameters

optim(c(mu=0, sigma=1), nLL)$par


## Fixing sigma = 2
nLL <- make.NegLogLik(normals, c(FALSE,2))
environment(nLL)$params
optimize(nLL, c(-1,3))$minimum


## Fixing mu =1
nLL <- make.NegLogLik(normals, c(1, FALSE))
environment(nLL)$params
optimize(nLL, c(1e-6,10))$minimum


# Plotting the Likelihood
nLL <- make.NegLogLik(normals, c(1, FALSE))
x<-seq(1.7, 1.9, len=100)
y<-sapply(x, nLL)
plot(x, exp(-(y-min(y))), type="l")

nLL <- make.NegLogLik(normals, c(FALSE,2))
x<-seq(0.5, 1.5, len=100)
y<-sapply(x, nLL)
plot(x, exp(-(y-min(y))), type="l")



