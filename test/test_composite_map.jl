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
is_active(it::Dummy_SAT) = it._is_active
activate!(it::Dummy_SAT) = it._is_active = true
deactivate!(it::Dummy_SAT) = it._is_active = false

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

    boolean_nres1 = NRES.Tile_map{Dummy_SAT}(the_sat=Dummy_SAT())
    boolean_nres2 = NRES.Tile_map{Dummy_SAT}(the_sat=Dummy_SAT())
    case = Composite_map(boolean_nres1, boolean_nres2)
    @test case._nres1 == boolean_nres1
    @test case._nres2 == boolean_nres2
    " Creating a composite NRES of two boolean NRES stores them as member variables "

    activate!(NRES.map_to_SAT(boolean_nres1))
    #@test get_value(case) == false


end

end # module TEST_COMPOSITE_MAP
