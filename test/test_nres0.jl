module TEST_NRES_0
using NRES
using Test

mutable struct Dummy_trait
    some_id
    _is_active
    function Dummy_trait()
        some_id = new(rand())
        new(some_id, false)
    end
end
activate!(it::Dummy_trait) = it._is_active = true
is_active(it::Dummy_trait) = it._is_active



@testset "Constructor NRES-0" begin
    case = NRES_0()
    @test isa(case, NRES_0)
    " Can concstruct nres_0 with empty argument "

    @test isa(case, NRES.Representation)
    " NRES_0 is a NRES.Representation "

    @test isnothing(NRES.active_traits_for())
    " By default: active_traits_for() is nothing "

    @test isnothing(NRES.active_traits_for(case))
    " .. and same for NRES_0 without conditional "

    the_SAT = Dummy_trait()
    case = NRES_0( the_SAT )
    @test isnothing(NRES.active_traits_for(case))
    " active_traits_for(case) returns nothing if case trait is false (default for Dummy_trait) "

    activate!(the_SAT)
    @test NRES.active_traits_for(case) == the_SAT
    " activate the SAT, and active_traits_for(boolean_NRES) returns the_SAT of the nres0 "


end

end #module TEST_NRES_0

