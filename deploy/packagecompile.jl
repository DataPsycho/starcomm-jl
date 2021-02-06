using Pkg
Pkg.activate(".")
Pkg.instantiate()

using PackageCompiler

create_sysimage(:StarComm;
    sysimage_path="StarComm.so",
    precompile_execution_file="deploy/precompile.jl")