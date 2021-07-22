# NRES
NRES -- A functional emulation of Neural Representation of Euclidean Space : 
a plasible foundation for cybernetic autonomy

The brain represent various Euclidean spaces by NRES, presumably for the use in navigation after different modalities have been combined.
The most intuitive NRES modality is how the place cell represent the current position of the self.
Cells for representing allocentric continuous parameters, e.g. Border cells [Solstad, 2009] or Object-Vector Cells [Høydal, 2019], represent continuous parameters by sparse coding over individual neurons.
Speed cells [Kropff et al, 2015] represent the velocity of the animal by the firing rate of neurons, demonstrating another modality for neural representation of continuous variables.
This (biological) neural mechanism for representing space is key in all orientation, as well as in thinking, reasoning, and other possibly other aspects of intelligence[Bellmund et al, 2018]. 

In this package, a mapping from continuous space (Euclidean space) to an element of [SAT-modules].
A :SAT-module: represents a conditional that can be activated based on the external situation.
(SAT is not part of the NRES module, but has a defined interface as listed further down in this file).
NRES creates a distributed mapping of activated traits.
(SAT is a generalization of traits as seen in Place Cells, OVC, Head Direction Cells, etc. Inspire by..)


[Solstad, Trygve. *Neural representations of Euclidean space.* (2009).]  
[Kropff, Emilio, et al. *Speed cells in the medial entorhinal cortex.* Nature 523.7561 (2015): 419-424.]  
[Bellmund, Jacob LS, et al. *Navigating cognition: Spatial codes for human thinking.* Science 362.6415 (2018).]  
[Høydal, Øyvind Arne, et al. *Object-vector coding in the medial entorhinal cortex.* Nature 568.7752 (2019): 400-404.]  

## Design
The sole responsibility of the NRES module is to represent a Euclidean space by NRES principles.
Can be done by N5-coding, i.e. discretization of a square area into N-by-N tiles. `NRES.tile_map`
Can also be done by other, more sparsely coded sets. `NRES.place_cell`
Can also be done by grid-cell coding.               `NRES.grid_cell`
Etc.

`my_map = NRES.Tile_map(N=5, dim=2, range=[0,1])` creates a struct with 5-by-5 tile set of [[0,1],[0,1]]
Use: `encode(coord, my_map)`   ->      returns the SAT that is activated by coord, or `None`
     (Important that length(coord) == map._dim )
     (Returns `None` if no SAT is activated by coord)
     

:SAT-module: A SAT-module is defined elsewhere, but it is important that this type supports the following functions:
    - I enkelte NRES-modaliteter brukes `is_active(module)`, men det kan vente.
    - (.. men andre steder en følgende også brukt:  
        - activate!(module)
        - deactivate!(module)
      )

