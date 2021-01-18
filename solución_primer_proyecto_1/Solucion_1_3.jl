### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ fc87f4f8-59c4-11eb-392e-d9c35c32136b
using Plots

# ╔═╡ e7865034-59c1-11eb-26ee-2db52da874fb
md"1. Graficar una forma biológica, par un c arbitrario (monocromático)."

# ╔═╡ 156d1336-59c2-11eb-3993-f378dce3e74c
md"sea la función $f_{\beta}$ definida de la siguiente manera:"

# ╔═╡ 1b19b80a-59c2-11eb-0c9f-0d9be321155b
function fᵦ(z,c)
	return(sin(z)+z^2+c)
end

# ╔═╡ 8078381e-59c2-11eb-147c-9992477a53b2
md"El criterio de convergencia usado para determinar los elementos de la familia del conjunto  es: $|Z_{n}|<=2$"

# ╔═╡ 87230132-59c2-11eb-1f9a-8fcb35a8a085
function testJM(z::Complex)
	
	return(real(z*conj(z)) <= 2)
	
end

# ╔═╡ 8e0a8a38-59c2-11eb-30c1-a37852ea919a
mutable struct condiciones
	c::Complex
	z₀::Complex
	minimo::Float64
	maximo::Float64
	Tmax::Int64
	zconjunto::Array
end

# ╔═╡ aa01fe60-59c2-11eb-24ac-35189d987fd1
begin
	cond_init = condiciones(0.001+0.0im,0.15+0.15im,-2,2,200,[])
	z = fᵦ(cond_init.z₀,cond_init.c)
	push!(cond_init.zconjunto,cond_init.z₀,z)
	
	for k in 1:cond_init.Tmax
		z = fᵦ(z,cond_init.c)
		if testJM(z)
			push!(cond_init.zconjunto,z)
		end
	end
end


# ╔═╡ a0a93af2-59c4-11eb-0f2d-515880d6d441
length(cond_init.zconjunto),cond_init.zconjunto 

# ╔═╡ cd08eeda-59c4-11eb-39bc-47ba74476a57
begin
	scatter(real(cond_init.zconjunto),imag(cond_init.zconjunto),
			title = "conjunto Biologico",
			legend=false,
			aspectratio=1)
	xlabel!("Real(z)")
	ylabel!("Imaginario(z)")
end

# ╔═╡ Cell order:
# ╟─e7865034-59c1-11eb-26ee-2db52da874fb
# ╠═fc87f4f8-59c4-11eb-392e-d9c35c32136b
# ╟─156d1336-59c2-11eb-3993-f378dce3e74c
# ╠═1b19b80a-59c2-11eb-0c9f-0d9be321155b
# ╟─8078381e-59c2-11eb-147c-9992477a53b2
# ╠═87230132-59c2-11eb-1f9a-8fcb35a8a085
# ╠═8e0a8a38-59c2-11eb-30c1-a37852ea919a
# ╠═aa01fe60-59c2-11eb-24ac-35189d987fd1
# ╠═a0a93af2-59c4-11eb-0f2d-515880d6d441
# ╠═cd08eeda-59c4-11eb-39bc-47ba74476a57
