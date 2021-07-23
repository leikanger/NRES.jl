module TEST_TILE_MAP
using NRES
using Test

struct Dummy_type end

@testset "Constructing Tile_map with dimensjonality ZERO" begin
    case = NRES.Tile_map{Dummy_type}()
    @test isa(case, NRES.Representation)
    " NRES.Tile_map with empty argument "

    @test dim_Euclidean_space(case) == 0
    " The NRES.Tile_map() empty ctor gives a zero-dimentional Tile_map (a point-representation) "

    @test isa(case._all_SAT, Array)
    " Even zero-dimensional NRES maps have an array of SAT "

    @test length(case._all_SAT) == 1
    " A zero-dimentional tile-map has exactly on SAT in this array "

    @test isa(case._all_SAT[1], Dummy_type)
    " Point-NRES contains one element of the supplied type T "

    #case = NRES.Tile_map(42)
    #@test isa(case._all_SAT[1], Int)
    #" Dette demonstrerer korleis det er mulig å skille mellom ulike typer i CTOR "
    @test_throws ArgumentError NRES.Tile_map(42)
    " Int doesn't have the necessary functions and properties to be a SAT: Error "

    case = NRES.Tile_map(Dummy_type())
    @test isa(case._all_SAT[1], Dummy_type)
    " Tile map can be constructed by argument "

    the_dummy = Dummy_type()
    case = NRES.Tile_map(the_dummy)
    @test case._all_SAT[1] === the_dummy
    " Equivalence: the supplied SAT becomes the 0-dim NRES consitional "
end

@testset "Constructing Tile_map with dimensjonality ONE" begin
    #case = NRES.Tile_map{Dummy_type}(dim=1)
    #@test dim_Euclidean_space(case) == 1
    
    # * ctor for dim=1
    #   - gir 1D vektor med typer {T}
    # * range: Euclidean interval used.
    #   - vektor.first inneholder nedre posisjon
    #   - vektor.last  inneholder øvre posisjon 
    # * N: How many parts the axis is divided into
    #   - N == 0 throws error
    #   - N == 1 gir zeroDim NRES
    #   - N == 2    =>  vektor.first != vektor.last
    #   - N == 2    =>  posisjon: øvre posisjon gir annen retur-T enn pos:nedre-posisjon av range.
    #   - N == 3    =>  
    # - 
end

end # module TEST_TILE_MAP
