module Resource

using HTTP 
using JSON3
using ..Model, ..Service, ..Workers

const ROUTER = HTTP.Router()

respond(req) = Service.reply(JSON3.read(req.body, Request))::Response
HTTP.@register(ROUTER, "POST", "/discovery", respond)

respond_threaded(req) = fetch(Workers.@async(Service.reply(JSON3.read(req.body, Request))::Response))
HTTP.@register(ROUTER, "POST", "/discovery-threaded", respond)


function request_handler(req)
    obj = HTTP.handle(ROUTER, req)
    return HTTP.Response(200, JSON3.write(obj))
end

function run()
    HTTP.serve(request_handler, "0.0.0.0", 8080)
end

end

