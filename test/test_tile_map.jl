module TEST_TILE_MAP
using NRES
using Test

@testset "Constructing Tile_map" begin
    case = NRES.Tile_map()
    @test isa(case, NRES.Representation)
    "NRES.Tile_map with empty argument"
end

end # module TEST_TILE_MAP
