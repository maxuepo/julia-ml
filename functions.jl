using Statistics

function mrr(scores, targets, top_n=10)
    s = 0
    for (scores, targets) in zip(scores, scores)
        sorted_scores = sortperm(-scores)
        ranked_targets = targets[sorted_scores][begin:min(top_n, end)]
        s += 1//findall(x -> x != 0, ranked_targets)[1]
    end
    return s / length(scores)
end

function mae(y_pred, y; agg = mean)
    agg(abs.(y_pred .- y))
end
