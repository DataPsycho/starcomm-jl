module Client
using HTTP, JSON3
using ..Model

const SERVER = Ref{String}("http://localhost:8080")

function send_message(sender, message)
    body = (from=sender, message=message)
    resp = HTTP.post(string(SERVER[], "/discovery"), [], JSON3.write(body))
    return JSON3.read(resp.body, Response)
end

function send_message_threaded(sender, message)
    body = (from=sender, message=message)
    resp = HTTP.post(string(SERVER[], "/discovery-threaded"), [], JSON3.write(body))
    return JSON3.read(resp.body, Response)
end

end #