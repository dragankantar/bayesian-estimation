functions{
    real custom_prob_lpdf(real x, real a){ //_lpdf specifies to compiler that the function
                                           // is log probability density function
        return(log1m(a) - a * log(x)); // log1m is natural log of 1-a
    }
}

data{
    int N;
    real x[N];
}

parameters{
    real <lower=0, upper=1> a;
}

model{
    for(i in 1:N)
        X[i] ~ custom_prob(a);
        // alternatively: target += custom_prob_lpdf(x[i] | a)
        // alternatively_2: if the function is defined without _lpdf then in model segment
            // we specify as target += custom_prob(x[i], a)
}
