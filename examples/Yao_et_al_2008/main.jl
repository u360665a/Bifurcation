module Bifurcation

export fp, ev, br, diagram

using PyPlot;

include("model/model.jl");
using .Model;
include("model/differentialEquation.jl");

include("../../bifurcation.jl");

include("bifurcationAnalysis.jl")
include("bifurcationDiagram.jl");

end  # module