function rr(scores, targets)
    sorted_scores = sortperm(-scores)
    ranked_targets = targets[sorted_scores]
    return 1//findall(x -> x != 0, ranked_targets)[1]
end

function mrr(list_of_scores, list_of_targets)
    return [rr(scores, targets) for (scores, targets) in zip(list_of_scores, list_of_targets)]
end

scores = [[2, 1, 3], [1, 2, 3]]
targets = [[1, 0, 0], [1, 0, 0]]     
    
mean_reciprocal_rank = mrr(scores, targets)
