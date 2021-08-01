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



@testset "Constructing Tile_map with dimensjonality ZERO" begin
    NRES.nres_0()
end

end #module TEST_NRES_0

