f = open("test")
a= []
for l in readlines(f)
    s = [parse(Int, d) for d in split(l, " ")]
    push!(a, s)
end
prod = 0

function check_prod_diag_right()
    global prod, a
    for i in 1:length(a)-3
        for j in 1:length(a[i])-3
            diag_prod = a[i][j] * a[i+1][j+1] * a[i+2][j+2] * a[i+3][j+3]
            if diag_prod > prod
                println("DIAGRIGHT ", diag_prod)
                prod = diag_prod
            end
        end
    end
end

function check_prod_diag_left()
    global prod, a
    for i in 1:length(a)-3
        for j in 4:length(a[i])
            diag_prod = a[i][j] * a[i+1][j-1] * a[i+2][j-2] * a[i+3][j-3]
            if diag_prod > prod
                println("DIAGLEFT ", diag_prod)
                prod = diag_prod
            end
        end
    end
end

function check_prod_left()
    global prod, a
    for i in 4:length(a)
        for j in 4:length(a[i])
            diag_prod = a[i][j] * a[i-1][j] * a[i-2][j] * a[i-3][j]
            if diag_prod > prod
                println("LEFT ", diag_prod)
                prod = diag_prod
            end
        end
    end
end

function check_prod_right()
    global prod, a
    for i in 1:length(a)-3
        for j in 1:length(a[i])-3
            diag_prod = a[i][j] * a[i+1][j] * a[i+2][j] * a[i+3][j]
            if diag_prod > prod
                println("RIGHT ", diag_prod)
                prod = diag_prod
            end
        end
    end
end

function check_prod_up()
    global prod, a
    for i in 4:length(a)
        for j in 1:length(a[i])
            diag_prod = a[i][j] * a[i-1][j] * a[i-2][j] * a[i-3][j]
            if diag_prod > prod
                println("UP ", diag_prod)
                prod = diag_prod
            end
        end
    end
end

function check_prod_down()
    global prod, a
    for i in 1:length(a)-4
        for j in 1:length(a[i])
            diag_prod = a[i][j] * a[i+1][j] * a[i+2][j] * a[i+3][j]
            if diag_prod > prod
                println("DOWN ", diag_prod)
                prod = diag_prod
            end
        end
    end
end
check_prod_diag_right()
check_prod_diag_left()
check_prod_left()
check_prod_right()
check_prod_up()
check_prod_down()
