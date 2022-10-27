include("metrics.jl")
include("functions.jl")

scores = [[2, 1, 3], [1, 2, 3]]
targets = [[1, 0, 0], [1, 0, 0]] 

y = [0, 1, 0]
y_pred = [0, 1, 0]

println(Metrics.mae(y, y_pred))
println(Metrics.mrr(scores, targets))
