module TEST_TILE_MAP
using NRES
using Test

struct Dummy_type 
    some_id
    some_more
    function Dummy_type(arg=nothing)
        if !isnothing(arg)
            some_id = arg
        else
            some_id = new(rand())
        end
        new(some_id, Nothing)
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

    @test case._number_of_intervals == 1
    " monosatian NRES have a single SAT => N=1 "
end

@testset "Constructing Tile_map with dimensjonality ONE" begin
    @testset "Range" begin
        steps_N = 2
        @test_throws MethodError NRES.Tile_map{Dummy_type}(:anna_enn_nothing_eller_tuple, N=steps_N)
        @test_throws MethodError NRES.Tile_map{Dummy_type}((:ikkje_Real ,:endpoints), N=steps_N)
        " Range skal være av type Tuple{<:Real, <:Real} : viser endepunkta på lineær akse "

        some_bolean_sat = Dummy_type()
        @test_throws ArgumentError NRES.Tile_map{Dummy_type}((0,1), N=steps_N, the_sat=some_bolean_sat)
        " If the_sat is spesified, i.e. NRES with a single SAT, specifying a range trows ArgumentError "

        case = NRES.Tile_map{Dummy_type}( (0.,2.), N=steps_N ) #[(0.,1.)])
        @test case._ranges == (0,2)
        " First argument is range: can be a tuple (A,B) that signifies from A to B "

        @test_throws MethodError NRES.Tile_map{Dummy_type}((1,2,3), N=steps_N)
        " Range med meir enn to endepunkt kaster MethodError "

        @test case._number_of_intervals == 2
 # TODO FIKS KOMMENTAR:       " monosatian NRES have a single SAT => N=1 "
    end
    " Testset som ser på contrucksjon: Range. "

    @testset "Diskretisering" begin
        unit_range = (0.0, 1.0)

        @test_throws ArgumentError NRES.Tile_map{Dummy_type}( unit_range, N=missing )

        case_N1 = NRES.Tile_map{Dummy_type}( unit_range, N=1 )
        @test length(case_N1._all_SAT) == 1
        " With N=1, you get one SAT "

        case_N2 = NRES.Tile_map{Dummy_type}( unit_range, N=2 )
        @test length(case_N2._all_SAT) == 2
        " With N=2, you get two SAT "

        case_N3 = NRES.Tile_map{Dummy_type}( unit_range, N=3 )
        @test length(case_N3._all_SAT) == 3
        " With N=3, you get three SAT "

        case = NRES.Tile_map{Dummy_type}( unit_range, N=100 )
        @test length(case._all_SAT) == 100
        " With N=100, you get 100 SAT "

        for it ∈ case_N3._all_SAT
            isa(it, Dummy_type)
        end
        " All elements in vector is of type T "

        @test case_N1._number_of_intervals == 1 
        @test case_N2._number_of_intervals == 2 
        @test case_N3._number_of_intervals == 3
        @test case._number_of_intervals == 100
        " member variable that holds N "
    
        @test first(case_N1._all_SAT) == last(case_N1._all_SAT)
        @test first(case_N2._all_SAT) != last(case_N2._all_SAT)
        " N1: first = last. N2 first != last. "

        # TODO Gjør BoundsError bedre: gjør en test i map_to_SAT som sjekker bounds?
        @test NRES.map_to_SAT(case_N2, first(unit_range)) == first(case_N2._all_SAT)
        @test NRES.map_to_SAT(case_N2, last(unit_range))  == last(case_N2._all_SAT)
        " Ytterpunkta: I N2 gir first coordinate den første SAT, og last coordinate siste SAT "

        @test_throws ArgumentError NRES.map_to_SAT(case_N2, first(unit_range)-0.001)
        @test_throws ArgumentError NRES.map_to_SAT(case_N2, last(unit_range)+0.001)
        " Utafor ytterpunkta: Kastar ArgumentError "
    end
end

end # module TEST_TILE_MAP
