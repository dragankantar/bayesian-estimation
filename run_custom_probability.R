library(rstan)

data = read.csv("data.csv")

model = stan_model('custom_prob.stan')

fit = sampling(model, data=list(N=length(data), x=data), iter=200, chains=4)
print(fit)
