module Node

""" sat_container inherits to NRES, and can e.g. represent a mutually exclusive set of SAT """
abstract type SAT_container end

""" A SAT is ALWAYS a member of a containing group! -- required ctor argument: member_of_group
(consider releasing this requirement for binary SAT-groups: [accomplished], [not accomplished] )
"""
mutable struct SAT
    _member_of_group::SAT_container
    _activation::Bool
    function SAT(;member_of_set::SAT_container)
        default_activation = false
        return new(member_of_set, default_activation)
    end
end

function is_active(node::SAT)
    node._activation
end
not_active(node::SAT) = !is_active(node)

function activate!(node::SAT)
    node._activation = true
end

function deactivate!(node::SAT)
    node._activation = false
end

export activate!, SAT_container, SAT
end #module Node
