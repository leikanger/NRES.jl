module Node

mutable struct SAT
    _activation::Bool
    function SAT()
        default_activation = false
        return new(default_activation)
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

export activate!
end #module Node
