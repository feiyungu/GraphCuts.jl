# gco types
typealias GCObool               Cuchar
typealias GCOnode_id            Cint
typealias GCOLabelID            Cint
typealias GCOEnergyTermType     Cint
typealias GCOEnergyType         Union{Cint, Clonglong}
typealias GCOVarID              GCOnode_id
typealias GCOSiteID             GCOVarID

# gco structs
immutable GCOSparseDataCost
    site::GCOSiteID
    cost::GCOEnergyTermType
end
