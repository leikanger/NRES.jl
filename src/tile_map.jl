
mutable struct Tile_map{T} <: Representation
    _dimentionality
    _all_SAT
    function Tile_map(arg::T; dim=Missing) where {T}
        if(T<:Number)
            bolean_SAT_trait = T(0)
            throw(ArgumentError("Dette er bare for demonstrasjon. Å bruke dette blir bare teit.."))
        else
            bolean_SAT_trait = T()
        end
        new{T}(0, [bolean_SAT_trait])
    end
end

Tile_map{T}() where {T}       = Tile_map(T(), dim=0) 
Tile_map{T}() where {T<:Real} = Tile_map(T(0), dim=0) 

function dim_Euclidean_space(arg::Tile_map)
    # TODO member variable _dimentionality TO BE REMOVED!
    # (length(_ranges) eller noke er bedre! )
    # (( men hugs at punkt-oppføringer i Tile map er ekvivalent med bolean conditional))
    # (( .. og håndteres likt ))
    return arg._dimentionality
end


export dim_Euclidean_space
