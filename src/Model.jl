module Model

using StructTypes
using Dates
using JSON3

export Request, Response

mutable struct Request
    from::String
    message::String
    requesttime::String
end

# Outer Constructor function for creating a request object
Request(from, message) = Request(from, message, string(now()))
# Empty Constructor function for parsing json string
Request() = Request("", "", string(now()))
# Json Decoder
StructTypes.StructType(:: Type{Request}) = StructTypes.Mutable()

mutable struct Response
    to::String
    message::String
    respondtime::String
end


# Outer Response constructor function for creating a request object
Response(to, message) = Response(to, message, string(now()))
# Empty constructor Response function for parsing json string
Response() = Response("", "", string(now()))
# Json Decoder
StructTypes.StructType(:: Type{Response}) = StructTypes.Mutable()
end