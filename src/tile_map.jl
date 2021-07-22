
mutable struct Tile_map{T} <: Representation
    _dimentionality
    _all_SAT
    function Tile_map(arg::T) where {T}
        new{T}(0, [T()])
    end
end

Tile_map{T}() where {T}       = Tile_map(T()) 
#Tile_map{T}() where {T<:Real} = Tile_map(T(0)) 
