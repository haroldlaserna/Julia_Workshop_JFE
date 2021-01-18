### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 7c320e7e-5915-11eb-328a-b1acd16d5723
using Random

# ╔═╡ 60a4bcfc-590a-11eb-0797-0564ca741367
using Plots

# ╔═╡ ada9870a-584a-11eb-102b-49849266d20d
md"1. Graficar un conjunto de Julia para un $c$ arbitrario (monocromático)."

# ╔═╡ 8c40b632-590e-11eb-2d7f-255da9d63080
md"Sea la función $f_{j}$ definida e la siguente manera:" 

# ╔═╡ 72035a84-5866-11eb-0aa9-172b8cf2e737
fⱼ(z,c) = z^2 + c

# ╔═╡ b779e788-590e-11eb-2465-f31b80294ff6
md"Usamos la libreria `Random` para escoger un número aleatorio de la siguiente forma:"

# ╔═╡ dd0153ba-590e-11eb-1289-2f159ca3a377
md"Para obtener un número aleatorio en un rango dado usamos la siguiente expresion:
$a =(max-min)*r + min$. 
Donde $r$ es un número aleatorio obenido de una distribución uniforme, con esto generamos la siguiente función:"

# ╔═╡ 2def0886-58ff-11eb-01b3-df10bea39c31
function escoger_aleatorio(minimo,maximo)
	return((maximo-minimo)*rand() + minimo +1im*((maximo-minimo)*rand() + minimo))
end

# ╔═╡ 448cefb2-590f-11eb-3d46-8d2ec445fa82
md"Si deseamos escoger el valor real e imaginario de forma aleatoria de un número complejo usamos la siguiente función:"

# ╔═╡ 7f65eb34-590f-11eb-2d1e-ab1e0275f457
md"El criterio de convergencia usado para determinar los elementos de la familia del cnojunto de Julia es: $|Z_{n}|<=2$"

# ╔═╡ b0e0678e-5867-11eb-2fe1-af35a1f2e035
function testJM(z::Complex)
	
	return(real(z*conj(z)) <= 2)
	
end

# ╔═╡ 85353be2-58ff-11eb-3404-954bd75b9f1c
function escoger_z(minimo,maximo)
	z = escoger_aleatorio(minimo,maximo) + escoger_aleatorio(minimo,maximo)*1im 
	
	while !testJM(z)
		z = escoger_aleatorio(minimo,maximo) + escoger_aleatorio(minimo,maximo)*1im
	end
	return(z)
end

# ╔═╡ ad37a232-590f-11eb-3ab5-31ca40e16697
md"Finalmente obtenemos el conjunto con el siguiente algoritmo:"

# ╔═╡ 3cc23b70-5911-11eb-0a57-f582c09d2d0c
struct condiciones
	c::Complex
	minimo::Float64
	maximo::Float64
	Tmax::Int64
	
end

# ╔═╡ ec5a5b0a-58f9-11eb-1821-e389d383235c
begin
	conj_cond = condiciones(0.4 + 0.3im,-2,2,200)
	T = 1:conj_cond.Tmax
	zconjunto = []
	conjunto_correcto = false
	
	while !conjunto_correcto
		
		zconjunto = []
		z = escoger_z(conj_cond.minimo, conj_cond.maximo)
		push!(zconjunto,z)
		for conteo in T
			z = fⱼ(z,conj_cond.c)
			if testJM(z)
				push!(zconjunto,z)
				if conteo == conj_cond.Tmax
					conjunto_correcto=true
				end
			else
				
				break
			end
		end
			
	end	
end

# ╔═╡ 1929a2d8-5910-11eb-2d04-65c8991cee25
md"el valor $z_{0}$ es:"

# ╔═╡ 262d0948-5910-11eb-2c69-7bd8b4341ad6
zconjunto[1]

# ╔═╡ 450a0d40-5910-11eb-09e9-97eaed447847
md"y $c$ es:"

# ╔═╡ 4c8cf1b6-5910-11eb-19b1-65e0f87dda07
conj_cond.c

# ╔═╡ bfddabac-590f-11eb-22a7-8f49288c8659
md"el conjunto es:"

# ╔═╡ 9d5dc6a4-5908-11eb-08bc-85b072ac6220
zconjunto

# ╔═╡ d3583bd4-590f-11eb-0d89-bd64f6750c6a
md"la gráfica correspondiente a la solución deseada es:"

# ╔═╡ 6c84698c-590a-11eb-1325-ff52a3a4fbd9
begin
	scatter(real(zconjunto),imag(zconjunto),
			title = "conjunto Julia",
			legend=false,
			aspectratio=1)
	xlabel!("Real(z)")
	ylabel!("Imaginario(z)")
end

# ╔═╡ Cell order:
# ╟─ada9870a-584a-11eb-102b-49849266d20d
# ╠═8c40b632-590e-11eb-2d7f-255da9d63080
# ╠═72035a84-5866-11eb-0aa9-172b8cf2e737
# ╟─b779e788-590e-11eb-2465-f31b80294ff6
# ╠═7c320e7e-5915-11eb-328a-b1acd16d5723
# ╠═60a4bcfc-590a-11eb-0797-0564ca741367
# ╟─dd0153ba-590e-11eb-1289-2f159ca3a377
# ╠═2def0886-58ff-11eb-01b3-df10bea39c31
# ╟─448cefb2-590f-11eb-3d46-8d2ec445fa82
# ╠═85353be2-58ff-11eb-3404-954bd75b9f1c
# ╠═7f65eb34-590f-11eb-2d1e-ab1e0275f457
# ╠═b0e0678e-5867-11eb-2fe1-af35a1f2e035
# ╠═ad37a232-590f-11eb-3ab5-31ca40e16697
# ╠═3cc23b70-5911-11eb-0a57-f582c09d2d0c
# ╠═ec5a5b0a-58f9-11eb-1821-e389d383235c
# ╟─1929a2d8-5910-11eb-2d04-65c8991cee25
# ╠═262d0948-5910-11eb-2c69-7bd8b4341ad6
# ╟─450a0d40-5910-11eb-09e9-97eaed447847
# ╠═4c8cf1b6-5910-11eb-19b1-65e0f87dda07
# ╟─bfddabac-590f-11eb-22a7-8f49288c8659
# ╠═9d5dc6a4-5908-11eb-08bc-85b072ac6220
# ╟─d3583bd4-590f-11eb-0d89-bd64f6750c6a
# ╠═6c84698c-590a-11eb-1325-ff52a3a4fbd9
