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

    case = MuExS()
    @test isa(case, NRES.SAT_container)
    " A MuExS is a SAT_container "


end

end#module TEST_NRES


