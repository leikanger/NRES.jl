module TEST_NRES_0
using NRES
using Test

struct Dummy_SAT
    some_id
    function Dummy_type(arg=nothing)
        if !isnothing(arg)
            some_id = arg
        else
            some_id = new(rand())
        end
        new(some_id)
    end
end



@testset "Constructor NRES-0" begin
    case = NRES_0()
    @test isa(case, NRES_0)
    " Can concstruct nres_0 with empty argument "

    @test isa(case, NRES.Representation)
    " NRES_0 is a NRES.Representation "

end

end #module TEST_NRES_0

