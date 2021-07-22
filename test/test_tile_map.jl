module TEST_TILE_MAP
using NRES
using Test

struct Dummy_type end

@testset "Constructing Tile_map with dimensjonality ZERO" begin
    case = NRES.Tile_map{Dummy_type}()
    @test isa(case, NRES.Representation)
    " NRES.Tile_map with empty argument "

    @test case._dimentionality == 0
    " The NRES.Tile_map() empty ctor gives a zero-dimentional Tile_map (a point-representation) "

    @test isa(case._all_SAT, Array)
    " Even zero-dimensional NRES maps have an array of SAT "

    @test length(case._all_SAT) == 1
    " A zero-dimentional tile-map has exactly on SAT in this array "

    @test isa(case._all_SAT[1], Dummy_type)
    " Point-NRES contains one element of the supplied type T "

    case = NRES.Tile_map(42)
    #@test isa(case._all_SAT[1], Int)

end

end # module TEST_TILE_MAP