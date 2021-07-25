
mutable struct Tile_map{T} <: Representation
    _dimentionality
    _all_SAT
    function Tile_map{T}(range; the_sat=missing, dim=missing) where {T}
        #if range==nothing & the_sat!=missing => FEIL (nå ingen range, så skal der vere EN sat!)
            
        if !ismissing(the_sat)
            if(!ismissing(dim) && dim!=0)
                throw(ArgumentError("Trying to create NRES with one SAT but multi-dimensional Euclidean space; this does not make sense"))
            end
            boolean_sat_trait = the_sat
        else
            # HER : if dim==0, så:
            boolean_sat_trait = T()
            # ELLERS: noke anna..
        end
        new{T}(dim, [boolean_sat_trait])
    end
end

function Tile_map{T}(;the_sat=missing, dim=missing) where {T} 
    if ismissing(the_sat)
        the_sat = T()        
    end
#Tile_map{T}() where {T<:Real} = Tile_map{T}(nothing, the_sat=T(0), dim=0) 
    Tile_map{T}(nothing, the_sat=the_sat, dim=dim)
end

function dim_Euclidean_space(arg::Tile_map)
    # TODO member variable _dimentionality TO BE REMOVED!
    # (length(_ranges) eller noke er bedre! )
    # (( men hugs at punkt-oppføringer i Tile map er ekvivalent med bolean conditional))
    # (( .. og håndteres likt ))
    if ismissing(arg._dimentionality)
        return 0
    end
    return arg._dimentionality
end


export dim_Euclidean_space
