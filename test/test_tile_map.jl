module TEST_TILE_MAP
using NRES
using Test

struct Dummy_type 
    some_id
    function Dummy_type()
        some_id = new(rand())
    end
end

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

    case = NRES.Tile_map{Dummy_type}(the_sat = Dummy_type())
    @test isa(case._all_SAT[1], Dummy_type)
    " Tile map can be constructed by argument "

    the_dummy = Dummy_type()
    case = NRES.Tile_map{Dummy_type}(the_sat = the_dummy)
    @test case._all_SAT[1] === the_dummy
    " Equivalence: the supplied SAT becomes the 0-dim NRES consitional "

    NRES.Tile_map{Dummy_type}(the_sat=Dummy_type()) # OK
    #@test_throws ArgumentError NRES.Tile_map(the_sat=Dummy_type(), dim=1) 
    #@test_throws ArgumentError NRES.Tile_map(the_sat=Dummy_type(), dim=2) 
    " Spesified SAT (a single conditional) implies dim=0. If both args are specified: ArgumentError "
end

@testset "Constructing Tile_map with dimensjonality ONE" begin
    @testset "Range" begin
        steps_N = 2
        @test_throws MethodError NRES.Tile_map{Dummy_type}(:anna_enn_nothing_eller_tuple)
        @test_throws MethodError NRES.Tile_map{Dummy_type}((:ikkje_Real ,:endpoints))
        " Range skal være av type Tuple{<:Real, <:Real} : viser endepunkta på lineær akse "

        some_bolean_sat = Dummy_type()
        @test_throws ArgumentError NRES.Tile_map{Dummy_type}((0,1), the_sat=some_bolean_sat)
        " If the_sat is spesified, i.e. NRES with a single SAT, specifying a range trows ArgumentError "

        case = NRES.Tile_map{Dummy_type}( (0.,2.) ) #[(0.,1.)])
        @test case._ranges == (0,2)
        " First argument is range: can be a tuple (A,B) that signifies from A to B "

        @test_throws MethodError NRES.Tile_map{Dummy_type}((1,2,3))
        " Range med meir enn to endepunkt kaster MethodError "
    end
    " Testset som ser på contrucksjon: Range. "

    @testset "Diskretisering" begin
        unit_range = (0.0, 1.0)

        case = NRES.Tile_map{Dummy_type}( unit_range, N=1 )
        # - N2 fører til vektor av {T} med lengde N
        # - Dersom N ikkje er oppgitt, men range er, så ArgumentError
        # - 

    end


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
