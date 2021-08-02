"""
"""
struct Composite_map{T}
    _nresA::T
    _nresB::T
    function Composite_map(nresA::T, nresB::T) where {T<:Representation}
        new{T}(nresA, nresB)
    end
end

function active_traits_for(map::Composite_map) 
    # vcat(A, B) concatenates arrays "vertidally", i.e. in first dim. after removing empty entries.
    vcat(active_traits_for(map._nresA), active_traits_for(map._nresB))
end
#is_active(it::Composite_map) = is_active(map_to_SAT(it._nres1)) * is_active(map_to_SAT(it._nres2))

export Composite_map
