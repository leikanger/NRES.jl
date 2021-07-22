
mutable struct Tile_map{T} <: Representation
    _dimentionality
    _all_SAT
    function Tile_map(arg::T) where {T}
        if(T<:Number)
            bolean_SAT_trait = T(0)
        else
            bolean_SAT_trait = T()
        end
        new{T}(0, [bolean_SAT_trait])
    end
end

Tile_map{T}() where {T}       = Tile_map(T()) 
Tile_map{T}() where {T<:Real} = Tile_map(T(0)) 
