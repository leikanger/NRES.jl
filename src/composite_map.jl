"""
"""
struct Composite_map{T}
    _nres1::T
    _nres2::T
    function Composite_map(nres1::T, nres2::T) where {T<:Representation}
        new{T}(nres1, nres2)
    end
end

function active_sat_in(nres1::Composite_map) 
    Any[]
end
#is_active(it::Composite_map) = is_active(map_to_SAT(it._nres1)) * is_active(map_to_SAT(it._nres2))

export Composite_map
