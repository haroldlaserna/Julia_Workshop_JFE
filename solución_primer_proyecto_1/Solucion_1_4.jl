### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 91e9e3b0-59cc-11eb-0820-63a0a6d8d03d
using Plots

# ╔═╡ e11d6fa6-59c5-11eb-1951-c3113fa40ed5
md"1. Hacer una gráfica a color del conjunto de Mandelbrot usando el algoritmo de Tiempo de Escape."

# ╔═╡ 593d82a0-59cd-11eb-1ee4-c7d1c5616ce8
md"Definimos el limite de la norma de la siguiente forma"

# ╔═╡ bb9da260-59c6-11eb-0e20-5d04f16f2794
function TestC(z::Complex)
	return(real(conj(z)*z) <= 2)
end

# ╔═╡ 271a7b82-59ca-11eb-17ce-67170aeebec7
TestC(0+0im)

# ╔═╡ 654c61cc-59cf-11eb-1584-615ddfe89f4f
md"sea la funcion $f_{m}$"

# ╔═╡ 44ebf35a-59c7-11eb-22b6-af7e9f68b234
function fₘ(z::Complex,c::Complex)
	return(z^7+c)
end

# ╔═╡ 78a671a2-59cf-11eb-1f5d-45e9ef654649
md"Creamos el algoritmos que determine cuantas veces podemos usar la función $f_{m}$ cumpliendo la condición impuesta en TestC"

# ╔═╡ 0f7b2144-59c9-11eb-1aa0-c5e09fccc3c9
function tiempo_escape(c::Complex)
	conteo = 0
	z = 0 + 0im
	Tmax = 200
	
	for i in range(1, step=1, Tmax)
		z = fₘ(z,c)
		if TestC(z)
			conteo += 1	
			if i == Tmax
				return(conteo)
			end
		else
			return(conteo)
			
		end
	end
		

end

# ╔═╡ d3d54622-59cf-11eb-28b7-e5302945d75d
md"comprobamos que esté funcionando correctamente"

# ╔═╡ f64f9676-59ca-11eb-2ab7-9bdaae3dd816
tiempo_escape(0.023+0.02im)

# ╔═╡ 0748f866-59d0-11eb-1e6d-f53999a44150
md"Generamos una matriz cuadrada la cual contiene el numero de conteos al aplicar la función esta matriz puede ser del tamaño que deseemos:"

# ╔═╡ eed0d732-59c7-11eb-318e-659630840d5e

begin
	x = -2:0.002:2
	y = -2:0.002:2
	colores = [0 for i in x, j in y ]
	a = 1
	for i in x
		b = 1
		for j in y 
			c = i + j*1im
			colores[b,a] = tiempo_escape(c)
			b += 1
		end
		a += 1
		println(a)
	end
end

# ╔═╡ d721e88e-59d0-11eb-3c9b-2146b86481a1
md"finalmente graficamos"

# ╔═╡ 8292c698-59cc-11eb-35db-0db68cef27b2
begin
heatmap(x, y, colores, color=cgrad(:thermal, rev = true), 
		    title="Conjunto de Mandelbrot", xlabel="Re(z)", ylabel="Im(z)",
		aspectratio=1)
end

# ╔═╡ Cell order:
# ╟─e11d6fa6-59c5-11eb-1951-c3113fa40ed5
# ╠═91e9e3b0-59cc-11eb-0820-63a0a6d8d03d
# ╟─593d82a0-59cd-11eb-1ee4-c7d1c5616ce8
# ╠═bb9da260-59c6-11eb-0e20-5d04f16f2794
# ╠═271a7b82-59ca-11eb-17ce-67170aeebec7
# ╟─654c61cc-59cf-11eb-1584-615ddfe89f4f
# ╠═44ebf35a-59c7-11eb-22b6-af7e9f68b234
# ╟─78a671a2-59cf-11eb-1f5d-45e9ef654649
# ╠═0f7b2144-59c9-11eb-1aa0-c5e09fccc3c9
# ╟─d3d54622-59cf-11eb-28b7-e5302945d75d
# ╠═f64f9676-59ca-11eb-2ab7-9bdaae3dd816
# ╟─0748f866-59d0-11eb-1e6d-f53999a44150
# ╠═eed0d732-59c7-11eb-318e-659630840d5e
# ╟─d721e88e-59d0-11eb-3c9b-2146b86481a1
# ╠═8292c698-59cc-11eb-35db-0db68cef27b2
