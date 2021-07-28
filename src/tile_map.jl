# NOTATER: Det er øpv å skrive følgande (gitt at TemporalType er "using"-introdusert i moder-module.
#   NyStruct <: TemporalType
# TODO: Du kan kjøre T<:TemporalType !

mutable struct Tile_map{T} <: Representation
    _range
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

function dimention_of_NRES(arg::Tile_map)
    if isnothing(arg._range)
        return 0
    else
        return 1
    end
    # (plan: kan den være rekursiv for composite NRES? )
end

"""
    function map_to_SAT(nres::Tile_map, coordinate::Real)

Map scalar coordinate to NRES-til set.
"""    
function map_to_SAT(nres::Tile_map, coordinate::Real)
    # TODO TODO  Kkjlør TDD
    # 
    # kjør full TDD her, dene må testas!
    #
    #
    #
    if isnothing(nres._range)
        return nres._all_SAT[1]
    end

    # Assuming 1D coordinate (c ∈ ℜ¹) within range of NRES: 
    if coordinate < first(nres._range) || coordinate > last(nres._range)
        throw(ArgumentError(string("Coordinate ", coordinate, " is not in range ", nres._range)))
    end
     
    # 0: create a linspace with the same steps
    value_list = range(first(nres._range), last(nres._range), length=nres._number_of_intervals)
    # 1: find index of first entry above coordinate value
    indeks = findfirst(value_list.>=coordinate) 
    # 2: Use this index when conllecting corresponding SAT from NRES map:
    nres._all_SAT[indeks]
end

export dimention_of_NRES
