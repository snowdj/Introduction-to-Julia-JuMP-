# Provide a strong/friendly and weak formulation for the mining problem.  
# 1,2
# 2,-4
# 3,-10
# 4,-6
# 5,3
# 6,9
# 7,-10
# 8,9
# 9,-5
# 10,15
# Condensed Version


using JuMP
m = Model()

p = [2; -4; -10; -6; 3; 9; -10; 9 ; -5; 15]

# @variable(m, x[1:10], Bin)
@variable(m, 0 <= x[1:10] <= 1)

@objective(m, Max, sum{p[i]*x[i], i in 1:10})

@constraint(m, const1,  2x[5] - x[1] - x[2] <=  0)
@constraint(m, const2,  2x[6] - x[2] - x[3] <=  0)
@constraint(m, const3,  2x[7] - x[3] - x[4] <=  0)
@constraint(m, const4,  2x[8] - x[5] - x[6] <=  0)
@constraint(m, const5,  2x[9] - x[6] - x[7] <=  0)
@constraint(m, const6,  2x[10] - x[8] - x[9] <=  0)

status = solve(m)

println("Status = $status")
println("Optimal Objective Function value: ", getobjectivevalue(m))
println("Optimal Solutions:")

sp = getvalue(x)
println(sp)


