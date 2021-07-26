# NOTATER: Det er øpv å skrive følgande (gitt at TemporalType er "using"-introdusert i moder-module.
#   NyStruct <: TemporalType


mutable struct Tile_map{T} <: Representation
    _ranges
    _number_of_intervals::Unsigned
    _all_SAT #::Vector{T}
    function Tile_map{T}(interval::Union{Nothing, Tuple{<:Real, <:Real}}; 
                         N::Union{Int,Missing}=missing,    the_sat=missing) where {T}

        if !ismissing(the_sat) && !isnothing(interval)
            throw(ArgumentError("Cannot have a single SAT for a Euclidean interval"))
        end
        !isnothing(interval) && ismissing(N)   &&   throw(ArgumentError("Interv is supplied but not N"))
        # Trur denne er unødvendig, sjå proxy-ctor under.
        #
        the_sat_vector = []
        if isnothing(interval) 
            if ismissing(the_sat)
                the_sat_vector = [T()]
            else
                the_sat_vector = [the_sat]
            end
            N = 1
        else
            # Dersom N is nothing, kast en error.
            for i in first(interval):1/N:last(interval)
                push!(the_sat_vector, T(i))
            end
            # Remove last?
            pop!(the_sat_vector)
            # the_map = Dict(i => T(10*i) for i=range(first(interval)), last(interval), length=1/N)
        end

        new{T}(interval, N, the_sat_vector)
    end
end

function Tile_map{T}(;the_sat=missing) where {T} 
    if ismissing(the_sat)
        the_sat = T()        
    end
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
    if coordinate < first(nres._ranges) || coordinate > last(nres._ranges)
        throw(ArgumentError(string("Coordinate ", coordinate, " is not in range ", nres._ranges)))
    end
    
    # Easy with 1D coordinate = ℜ¹
    value_list = range(first(nres._ranges), last(nres._ranges), length=nres._number_of_intervals)
    # 1: finn indeks til første verdi over coordinate.
    indeks = findfirst(value_list.>=coordinate) 
    # 2: bruk denne indeks for å hente ut tilhørande SAT. 
    nres._all_SAT[indeks]
    # 3: returner.
end

export dim_Euclidean_space
