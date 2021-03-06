module GCoptimization

using Cxx

const libPath = joinpath(dirname(@__FILE__), "..", "deps", "usr", "lib")
const includePath = joinpath(dirname(@__FILE__), "..", "deps", "usr", "include")

global const libgco = Libdl.find_library(["libGCoptimization", "libGCoptimization-x86", "libGCoptimization-x64"], [libPath])
if isempty(libgco)
    error("GCoptimization not properly installed. Please run Pkg.build(\"GCoptimization\")")
end

function __init__()
    addHeaderDir(libPath, kind=C_System)
    Libdl.dlopen(libgco, Libdl.RTLD_GLOBAL)
    cxxinclude(includePath*"/GCoptimization.h")
end

# types
export GCObool, GCOnode_id, GCOLabelID, GCOEnergyTermType, GCOVarID, GCOSiteID
export GCOSparseDataCost

# low-level APIs
export GCoptimizationGridGraph, setSmoothCostVH,
       GCoptimizationGeneralGraph, setNeighbors

export expansion, alpha_expansion, swap, alpha_beta_swap

export setDataCost, setSmoothCost, setLabelCost, setLabelSubsetCost, whatLabel,
       setLabel, setLabelOrder, compute_energy, giveDataEnergy, giveSmoothEnergy,
       giveLabelEnergy, numSites, numLabels, setVerbosity

# high-level APIs
export gco_αexpansion, gco_αβswap

export gco_create, gco_setneighbors, gco_setdatacost, gco_setsmoothcost,
       gco_setlabelcost, gco_expansion, gco_swap, gco_energy, gco_getlabeling,
       gco_setlabeling, gco_setlabelorder

# types
include("types.jl")

# low-level APIs
include("lowlevel.jl")

# core functionalities
include("core.jl")

# high-level APIs
include("highlevel.jl")

end # module
