
mutable struct Tile_map{T} <: Representation
    _ranges
    _all_SAT
    function Tile_map{T}(range::Union{Nothing, Tuple{<:Real, <:Real}}; 
                         N::Union{Int,Nothing}=nothing,    the_sat=missing) where {T}
        if !ismissing(the_sat) && !isnothing(range)
            throw(ArgumentError("Cannot have a single SAT for a Euclidean range"))
        end
        # Trur denne er unødvendig, sjå proxy-ctor under.
        if isnothing(range) && ismissing(the_sat)
            the_sat = T()
            range = nothing
        end

        #if range != nothing

        new{T}(range, [the_sat])
    end
end

function Tile_map{T}(;the_sat=missing) where {T} 
    if ismissing(the_sat)
        the_sat = T()        
    end
#Tile_map{T}() where {T<:Real} = Tile_map{T}(nothing, the_sat=T(0), dim=0) 
    Tile_map{T}(nothing, the_sat=the_sat)
end

function dim_Euclidean_space(arg::Tile_map)
    # TODO member variable _dimentionality TO BE REMOVED!
    # (length(_ranges) eller noke er bedre! )
    # (( men hugs at punkt-oppføringer i Tile map er ekvivalent med bolean conditional))
    # (( .. og håndteres likt ))
    return 0
end


export dim_Euclidean_space
