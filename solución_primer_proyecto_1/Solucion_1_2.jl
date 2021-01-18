### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ f23fd73e-59a8-11eb-2ead-597abae047ea
using Plots

# ╔═╡ 683072b2-5915-11eb-0071-8f21a39ec0ee
md"2. Graficar el conjunto de mandelbrot"

# ╔═╡ 57a9ef3a-5916-11eb-2ac9-ad4de25e7642
md"Sea la función $f_{m}$ definida e la siguente manera:" 

# ╔═╡ 6660e682-5916-11eb-2d8d-990c14743814
fₘ(z,c) = z^2 + c

# ╔═╡ ba5d51c6-5916-11eb-0dad-43548975c645
md"El criterio de convergencia usado para determinar los elementos de la familia del conjunto de Mandelbrot es: $|Z_{n}|<=2$"

# ╔═╡ c8be6bce-5916-11eb-20b8-71fc5681c4e0
function testJM(z::Complex)
	
	return(real(z*conj(z)) <= 2)
	
end

# ╔═╡ dd45b714-5916-11eb-15e0-93e37a1dfd3f
md"Finalmente obtenemos el conjunto con el siguiente algoritmo:"

# ╔═╡ e1b604ca-5916-11eb-2f72-9710b0921af4
mutable struct condiciones
	z₀::Complex
	c₀::Complex
	minimo::Float64
	maximo::Float64
	Tmax::Int64
	zconjunto::Array
end

# ╔═╡ 105a2f54-5917-11eb-12c3-798c5fc85782
begin
	cond_inic = condiciones(0+0im,0.15+0.5im,-2.0,2.0,200,[])

	z=fₘ(cond_inic.z₀,cond_inic.c₀)
	push!(cond_inic.zconjunto,z)
	
	for i in 1:cond_inic.Tmax
		z=fₘ(z,cond_inic.c₀)
		if testJM(z)
			push!(cond_inic.zconjunto,z)
		else
			break
		end
	end

end

# ╔═╡ ac81f628-59a8-11eb-3968-13b10c5dafc2
cond_inic.zconjunto

# ╔═╡ de462d78-59a8-11eb-1ca2-ab8f46f8eab8
begin
	scatter(real(cond_inic.zconjunto),imag(cond_inic.zconjunto),
			title = "conjunto Mandelbrot",
			legend=false,
			aspectratio=1)
	xlabel!("Real(z)")
	ylabel!("Imaginario(z)")
end

# ╔═╡ Cell order:
# ╟─683072b2-5915-11eb-0071-8f21a39ec0ee
# ╠═f23fd73e-59a8-11eb-2ead-597abae047ea
# ╟─57a9ef3a-5916-11eb-2ac9-ad4de25e7642
# ╠═6660e682-5916-11eb-2d8d-990c14743814
# ╠═ba5d51c6-5916-11eb-0dad-43548975c645
# ╠═c8be6bce-5916-11eb-20b8-71fc5681c4e0
# ╟─dd45b714-5916-11eb-15e0-93e37a1dfd3f
# ╠═e1b604ca-5916-11eb-2f72-9710b0921af4
# ╠═105a2f54-5917-11eb-12c3-798c5fc85782
# ╠═ac81f628-59a8-11eb-3968-13b10c5dafc2
# ╠═de462d78-59a8-11eb-1ca2-ab8f46f8eab8
