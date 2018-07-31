#session2_assignment_2.3

#"1. Create an m x n matrix with replicate(m, rnorm(n)) with m=10 column vectors of n=10 elements each, 
#constructed with rnorm(n), which creates random normal numbers. 
#Then we transform it into a dataframe (thus 10 observations of 10 variables) and perform an algebraic 
#operation on each element using a nested for loop: at each iteration, every element referred by the two 
#indexes is incremented by a sinusoidal function, compare the vectorized and non-vectorized form of creating 
#the solution and report the system time differences.



m=10
n=rnorm(10)
x=dataframe(replicate(m,rnorm(n)))
d=x
t1=Sys.time()
for (i in seq(nrow(x))) {
  for (j in seq(nrow(x))) {
    d[i,j]=round(d[i,j]+sin(1.570796),3)
  }
}

t2 = Sys.time()
print(paste0("For loop takes ",round((t2-t1),5)," seconds"))

z=x
t3 = Sys.time()
y=sapply(z,function(k) { k=round(k + sin(1.570796),3)})
t4 = Sys.time()
print(paste0("For loop takes ",round((t4-t3),5)," seconds"))

x[1,] ; y[1,] ; d[1,]