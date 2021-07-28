module NRES

# TODO TemporalType kan også includeres ved "using SAT" inne i NRES-module! 
# -> Vi kan mao. gå ut fra activate!(TemporalType) , deactivate!, is_active, osv..

"""
    abstract type Representation end

Representation interface:
    - function map_to_SAT   ->   returns SAT that corresponds to coordinate.
"""
abstract type Representation end

include("tile_map.jl")
include("composite_map.jl")


# export Node, SAT, MuExS
end # module
