## Background and Introduction

The motivation for all of this came from the following 3Blue1Brown video presenting "The inscribed square/rectangle problem, solved using Möbius strips and Klein bottles."

https://www.youtube.com/watch?v=IQqtsm-bBRU

further reading can be found here:

https://www.quantamagazine.org/new-geometric-perspective-cracks-old-problem-about-rectangles-20200625/


https://arxiv.org/pdf/2005.09193 (THE RECTANGULAR PEG PROBLEM - JOSHUA EVAN GREENE AND ANDREW LOBB)


I also ventured into my own area of this analysis applied to networks instead of curves.

## Structure

- customfunctions/
    - contains four custom MATLAB functions to do four essential tasks to make the reproduction of the tests easy to piece together
        - "fdistances.m" INPUT: n pairs of coordinates OUTPUT: nxn distance matrix
        - "finterpolate.m" INPUT: n pairs of coordinates, resolution  OUTPUTS: defines the curve at a higher resolution than input curve
        - "fmidpoints." INPUT: n pairs of coordinates, form="Matrix" or "List" OUTPUTS: the midpoints of all pairs in matrix or list form
    - all of above are collated and a base analysis is outputted by "fplot_topology.m" which works for any coordinate pair input

- functiontopologies/
    - contains analysis of shapes generated by functions
  
- networktopologies/
    - contains analysis of networks generated from Laplacian from py/

- polygon_topologies/
    - contains analysis of shapes generated by the coordinate output of the polygon drawn from PDE_modeller application from MATLAB's Partial Differential Equation add-on 

- pde_polygons/
    - contains the direct output code for the shapes generated from the PDE_modeller application
 
- py/
    - contains the python code to generate, test and output information for networks



## Polygons examples:

### Heart

https://prnt.sc/nurMIrgOY1ro

#### Star

![Screenshot_7.png](images/Screenshot_7.png)

### Functions Examples

#### Circle

![Screenshot_6.png](images/Screenshot_6.png)

#### Hourglass

![Screenshot_5.png](images/Screenshot_5.png)

#### sin(2*pi)

![Screenshot_4.png](images/Screenshot_4.png)

## Networks

Network construction was done in python, constructed from the following principles:

![Screenshot_1.png](images/Screenshot_1.png)

#### 50-node network

![output.png](images/output.png.png)

circlular representation:

![Screenshot_3.png](images/Screenshot_3.png)

spectral representation:

![image](images/Screenshot_2.png)


