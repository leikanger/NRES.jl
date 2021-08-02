struct NRES_0 <: Representation
    nres_trait
    function NRES_0(nres_conditional)
        new(nres_conditional)
    end
end
" No argument: default to false "
NRES_0() = NRES_0( false )

" member function for Representation traits: is_active(trait) "
is_active(trait) = trait._is_active
is_active(boolean::Bool) = boolean

""" 
    function active_traits_for(arg::T) where {T<:Representation} 
Returns active trait for arg::NRES_0
"""
active_traits_for()             = nothing
active_traits_for(arg::NRES_0)  = is_active(arg.nres_trait) ? arg.nres_trait : nothing


export NRES_0, active_traits_for
