
mutable struct Tile_map{T} <: Representation
    _ranges
    _number_of_intervals::Unsigned
    _all_SAT
    function Tile_map{T}(range::Union{Nothing, Tuple{<:Real, <:Real}}; 
                         N::Union{Int,Missing}=missing,    the_sat=missing) where {T}
        if !ismissing(the_sat) && !isnothing(range)
            throw(ArgumentError("Cannot have a single SAT for a Euclidean range"))
        end
        !isnothing(range) && ismissing(N)   &&   throw(ArgumentError("Range is supplied but not N"))
        # Trur denne er unødvendig, sjå proxy-ctor under.
        if isnothing(range) 
            if ismissing(the_sat)
                the_sat = T()
            end
            the_SAT_vector = [the_sat]
            N = 1
        else
            the_SAT_vector = []
            for sat_number ∈ 1:N
                push!(the_SAT_vector, sat_number)
            end
            # Dersom N is nothing, kast en error.
            # Ellers: legg til N sat i vektoren _all_SAT
        end

        new{T}(range, N, the_SAT_vector)
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

"""
    function map_to_SAT(nres::Tile_map, coordinate::Real)

Map coordinate to NRES-til set. Foreløpig: coordinate er en skalar..
"""    
function map_to_SAT(nres::Tile_map, coordinate::Real)
    #coordinate/nres.
    return nres._all_SAT[1]
end

export dim_Euclidean_space
