
mutable struct Tile_map <: Representation
    _dimentionality
    _all_SAT
    function Tile_map()
        new(0, [Missing])
    end
end

