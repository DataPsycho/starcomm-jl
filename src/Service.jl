module Service

using ..Model

function reply(obj)
    message = "Listening to $(obj.from); from Discovery. Over!"
    response = Response(obj.from, message)    
end

end # module