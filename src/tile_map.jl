
mutable struct Tile_map{T} <: Representation
    _dimentionality
    _all_SAT
    function Tile_map{T}() where {T}
        new(0, [T()])
    end
end

