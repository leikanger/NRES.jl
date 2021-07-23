
mutable struct Tile_map{T} <: Representation
    _dimentionality
    _all_SAT
    function Tile_map(; the_sat::T=missing, dim=missing) where {T}
        if !ismissing(the_sat)
            if(!ismissing(dim) && dim!=0)
                throw(ArgumentError("Trying to create NRES with one SAT but multi-dimensional Euclidean space; this does not make sense"))
            end
            boolean_sat_trait = the_sat
        else
            boolean_sat_trait = T()
        end
        new{T}(0, [boolean_sat_trait])
    end
end

Tile_map{T}() where {T}       = Tile_map(the_sat=T(), dim=0) 
Tile_map{T}() where {T<:Real} = Tile_map(the_sat=T(0), dim=0) 

function dim_Euclidean_space(arg::Tile_map)
    # TODO member variable _dimentionality TO BE REMOVED!
    # (length(_ranges) eller noke er bedre! )
    # (( men hugs at punkt-oppføringer i Tile map er ekvivalent med bolean conditional))
    # (( .. og håndteres likt ))
    return arg._dimentionality
end


export dim_Euclidean_space
