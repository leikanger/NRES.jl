module TEST_COMPOSITE_MAP
using NRES
using Test

@testset "Composite map ctor" begin
    @test_throws MethodError Composite_map()
end

end # module TEST_COMPOSITE_MAP
