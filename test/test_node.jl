module TEST_NODE
using NRES
using Test

@testset "SAT init" begin
    demoSet = NRES.MuExS()
    case = Node.SAT(member_of_set=demoSet)
    @test isa(case, Node.SAT)
    " Node.SAT initializes an instance of SAT "

    #@test isa(case._member_of_group, NRES.Node.SAT_container)

    @test !Node.is_active(case)
    @test  Node.not_active(case)
    " A node is initially inactive // default: not_active "

    Node.activate!(case)
    @test Node.is_active(case)
    " Node.activate! "

    Node.deactivate!(case)
    @test Node.not_active(case)
    " Node.deactivate! "
end

end #module TEST_NODE
