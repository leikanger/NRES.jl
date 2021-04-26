module NRES
include("node.jl")
using .Node

struct MuExS <: SAT_container
    _elements::Union{Nothing, Array{SAT}}
    function MuExS()
        new(nothing)
    end
end
length(Nothing) = 0
function Base.length(container::SAT_container)
    length(container._elements)
end


export Node, SAT, MuExS
end # module
