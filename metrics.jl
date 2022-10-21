abstract type Metric end

mutable struct MRR <: Metric name :: String end
mutable struct MAP <: Metric name :: String end


function eval(metric::MRR, list_of_scores::Vector, list_of_targets::Vector, top_n::Integer=10)
    s = 0
    for (scores, targets) in zip(list_of_scores, list_of_targets)
        sorted_scores = sortperm(-scores)
        ranked_targets = targets[sorted_scores][begin:min(top_n, end)]
        s += 1//findall(x -> x != 0, ranked_targets)[1]
    end

    return s / length(list_of_scores)
end
