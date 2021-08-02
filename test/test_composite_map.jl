module TEST_COMPOSITE_MAP
using NRES
using Test

mutable struct Dummy_SAT 
    _some_id
    _is_active::Bool
    function Dummy_SAT(arg=nothing)
        if !isnothing(arg)
            some_id = arg
        else
            some_id = new(rand())
        end
        new(some_id, false)
    end
end
activate!(it::Dummy_SAT)   = (it._is_active = true)
deactivate!(it::Dummy_SAT) = (it._is_active = false)
is_active(it::Dummy_SAT)   = it._is_active

case = Dummy_SAT()
@test !is_active(case)
activate!(case)
@test is_active(case)
deactivate!(case) 
@test !is_active(case)

@testset "Composite map ctor" begin
    @test_throws MethodError Composite_map()

    @test_throws MethodError Composite_map(true, Dummy_SAT())
    @test_throws MethodError Composite_map(Dummy_SAT(), Dummy_SAT())
    @test_throws MethodError Composite_map(Dummy_SAT(), false)
    " Ctor with other stuff than NRES as arg. raises MethodError "

    boolean_nresA = NRES.Tile_map{Dummy_SAT}(the_sat=Dummy_SAT())
    boolean_nresB = NRES.Tile_map{Dummy_SAT}(the_sat=Dummy_SAT())
    case = Composite_map(boolean_nresA, boolean_nresB)
    @test case._nresA == boolean_nresA
    @test case._nresB == boolean_nresB
    " Creating a composite NRES of two boolean NRES stores them as member variables "
end

@testset "Composite map function" begin
    satA = Dummy_SAT()  # inactive by default
    satB = Dummy_SAT()  # inactive by default
    n0_A = NRES_0(satA)
    n0_B = NRES_0(satB)
    case = Composite_map(n0_A, n0_B)

    @test isempty(NRES.active_traits_for(case))
    " both NRES0 A and B is inactive: active sat in composite map is empty vector "

    activate!(satA)
    @test NRES.active_traits_for(case) == [satA]
    " When satA is active: return satA "

    activate!(satB)
    @test NRES.active_traits_for(case) == [satA, satB]
    " When satA and satB is active, return both SAT "

    # satC = Dummy_SAT()  # inactive by default
    # n0_C = NRES_0(satC)
    # case_composite2 = Composite_map(case, n0_C)
    # @test NRES.active_traits_for(case_composite2) == [satA, satB]
    " Before the SAT of the new NRES is active, composite-of-composites returns same as previous test "

    #activate!(NRES.active_traits_for())
    # @test is_active(case) == true


end

end # module TEST_COMPOSITE_MAP
