module StarComm

export Model, Request, Response
export Service, Resource

include("Model.jl")
using .Model

include("Service.jl")
using .Service

include("Workers.jl")
using .Workers

include("Resource.jl")
using .Resource

include("Client.jl")
using .Client

function run()
    Workers.init()
    Resource.run()
end
end

