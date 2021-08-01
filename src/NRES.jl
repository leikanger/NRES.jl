module NRES

# TODO TemporalType kan også includeres ved "using SAT" inne i NRES-module! 
# -> Vi kan mao. gå ut fra activate!(TemporalType) , deactivate!, is_active, osv..

"""
    abstract type Representation end

Representation interface:
    - function map_to_SAT   ->   returns SAT that corresponds to coordinate.
"""
abstract type Representation end
# TODO: PLAN:
#   - function get_for_coord(coord, Repr.)
#
#   - function active_traits_in(map::Representation)
#   - treng mdl-variabel the_active_trait::T
#
#   - treng funktion activate_in_muex!(map::Representation, trait::T)
#       -> activates trait and deactivates current trait (if any). Save as prev. active (for learning)?

#function the_active_trait_in_muex(map::Representation)


""" 
    abstract type TemporalType 
Type for representing SAT and other elements that can partake in a temporal sequence. 
    - function is_active
    - function activate!
    - function deactivate!
"""
abstract type TemporalType end

abstract type SAT end

include("nres0.jl")
include("tile_map.jl")
include("composite_map.jl")


# export Node, SAT, MuExS
end # module
