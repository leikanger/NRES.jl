# NRES
A functional emulation of Neural Representation of Euclidean Space. 

This (biological) neural mechanism for representing space is key in all orientation, as well as in thinking, reasoning, and other possibly other aspects of intelligence[Bellmund et al, 2018]. 
Arguably the most intuitive and tangible Neural Representation of Euclidean Space is the place cell, a particular neuron that is active when the animal is located within the receptive field of that cell.
Cells for representing allocentric continuous parameters, e.g. Border cells [Solstad, 2009] or Object-Vector Cells [Høydal, 2019], represent continuous parameters by sparse coding over individual neurons.
Speed cells [Kropff et al, 2015] represent the velocity of the animal by the firing rate of neurons, demonstrating another modality for neural representation of continuous variables.

In this package, a mapping from continuous space (Euclidean space) to an element of [SAT].
A SAT represent a trait of the situation that can be activated or be inactive.
NRES creates a distributed mapping of activated traits.
A SAT is a generalization of traits as seen in Place Cells, Object Vector Cells, Head Direction Cells, with other identified neural representations in the brain.


[Solstad, Trygve. *Neural representations of Euclidean space.* (2009).]  
[Kropff, Emilio, et al. *Speed cells in the medial entorhinal cortex.* Nature 523.7561 (2015): 419-424.]  
[Bellmund, Jacob LS, et al. *Navigating cognition: Spatial codes for human thinking.* Science 362.6415 (2018).]  
[Høydal, Øyvind Arne, et al. *Object-vector coding in the medial entorhinal cortex.* Nature 568.7752 (2019): 400-404.]  
