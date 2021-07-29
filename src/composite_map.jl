"""
"""
struct Composite_map{T}
    _nres1::T
    _nres2::T
    function Composite_map(nres1::T, nres2::T) where {T<:Representation}
        new{T}(nres1, nres2)
    end
end

export Composite_map
