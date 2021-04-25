module TEST_NRES
using NRES
using Test

#=
#   Plan: NRES er en slags shepherd-rolle mtp. neural repr. of Euclidean space.
#   Her deles rommet opp, separate noder (celler) blir oppretta, og overordna
#   betraktninger kring representasjon er her.
#
#   F.eks. kor mange dimensjonar rommet har, kva parametre er med, oppløysing,
#   og tilsvarande betraktninger gjøres i struct NRES.
#
=#

@testset "construct place cell" begin
    @test_throws UndefKeywordError SAT()
    " Construction of SAT without SAT_container argument throuws "

    case_container = MuExS()
    @test isa(case_container, NRES.SAT_container)
    " A MuExS is a SAT_container "

    @test NRES.size(case_container) == 0
    " initially empty.. "

    case = SAT(member_of_set=case_container)
    @test case._member_of_group == case_container
    #@test size(case_container) == 1
    " Creating a SAT automatically places it into a SAT_container "



    # TEST:
    # - making a SAT creates an extra entry in the corresponding container.
end

# TEST MuExS: activation of one causes deactivation of the one that was active.
# + other MuExS functionality.
end#module TEST_NRES


