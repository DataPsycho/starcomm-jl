@testset "Test for Model.jl" begin
    @testset "Test for Request Type Serialization" begin
        message = """{"from": "Saru", "message": "Saru to Discovery, Over!", "requesttime": "2021-12-31"}"""
        expected = Request("Saru", "Saru to Discovery, Over!", "2021-12-31")
        decoded = JSON3.read(message, Request)
        @test isequal(expected.from, decoded.from)
        @test isequal(expected.message, decoded.message)
        @test isequal(expected.requesttime, decoded.requesttime)
    end

    @testset "Test for Response Type Serialization" begin
        message = """{"to": "Saru", "message": "Listening Tilly from Discovery, Over!", "respondtime": "2021-12-31"}"""
        expected = Response("Saru", "Listening Tilly from Discovery, Over!", "2021-12-31")
        decoded = JSON3.read(message, Response)
        @test isequal(expected.to, decoded.to)
        @test isequal(expected.message, decoded.message)
        @test isequal(expected.respondtime, decoded.respondtime)
    end
    
end