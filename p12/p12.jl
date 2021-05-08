function triangle_number(n::Int)
    S = 0
    for i in 1:n
        S = S + i
    end
    S
end

function factors(n::Int)
    f = []
    for i in 1:n
        if(n%i == 0)
            push!(f, i)
        end
    end
    f
end

for i in 10000:15000
    t = triangle_number(i)
    T = factors(t)
    if length(T) > 500
        print(t, " ", T)
        run(`notify-send Julia completed`)
    end
end
