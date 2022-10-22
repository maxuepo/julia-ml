include("metrics.jl")

scores = [[2, 1, 3], [1, 2, 3]]
targets = [[1, 0, 0], [1, 0, 0]] 

m1 = MRR("MRR", scores, targets, 10)
println(eval(m1))
