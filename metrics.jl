abstract type Metric end

mutable struct MRR 
    name::String
    list_of_scores::Vector
    list_of_targets::Vector
    top_n::Number
end

mutable struct MAP
    name :: String
    list_of_scores::Vector
    list_of_targets::Vector
    top_n::Number
end


function metric_evaluator(name::String, list_of_scores::Vector, list_of_targets::Vector)
    name_split = split(name, "@") 
    if name_split[1] == "MRR"
        return MRR(name_split[1], list_of_scores, list_of_targets, Integer(name_split))
    else
        return MAP(name_split[1], list_of_scores, list_of_targets, Integer(name_split))
    end
end

function eval(m::MRR)
    s = 0
    for (scores, targets) in zip(m.list_of_scores, m.list_of_targets)
        sorted_scores = sortperm(-scores)
        ranked_targets = targets[sorted_scores][begin:min(m.top_n, end)]
        s += 1//findall(x -> x != 0, ranked_targets)[1]
    end
    return s / length(m1.list_of_scores)
end

