module NRES
include("node.jl")
using .Node

struct MuExS <: SAT_container
    _elements::Union{Nothing, Array{SAT}}
    function MuExS()
        new(nothing)
    end
end
function size(container::SAT_container)
    return 0
end


export Node, SAT, MuExS
end # module
