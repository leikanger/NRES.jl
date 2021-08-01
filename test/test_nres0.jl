module TEST_NRES_0
using NRES
using Test

struct Dummy_SAT
    some_id
    function Dummy_type(arg=nothing)
        some_id = new(rand())
        new(some_id)
    end
end



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

end

end #module TEST_NRES_0

