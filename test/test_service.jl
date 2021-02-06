@testset "Test for Service.jl" begin
    @testset "Test for decode function" begin
        message = """{"from": "Saru", "message": "Saru to Discovery, Over!", "requesttime": "2021-12-31"}"""
        request = JSON3.read(message, Request)
        reply = Service.reply(request)
        @test isequal(request.from, reply.to)
    end
end