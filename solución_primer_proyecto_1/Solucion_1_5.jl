### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 085b9684-59d1-11eb-1901-dd44f7800da5
using Plots

# ╔═╡ 520ebc66-59d1-11eb-182e-a32905f8da84
md"
5. Realizar una gráfica a color para un conjunto de Julia, para un c arbitrario.
6. Realizar una gráfica a color para una forma biológica."

# ╔═╡ 1af6d394-59d1-11eb-301c-531dda660840
md"Definimos el limite de la norma de la siguiente forma"

# ╔═╡ 173b1e68-59d1-11eb-08b5-f3d76ef11132
function TestC(z::Complex)
	return(real(conj(z)*z) <= 2)
end

# ╔═╡ 31ff25fa-59d1-11eb-2e7c-efffc67d936a
md"Sea la función $f_{j}$ de la siguiente forma "

# ╔═╡ 173b0c8e-59d1-11eb-0940-3b9f41bcf23f
function fⱼ(z::Complex,c::Complex)
	return(z^2+c)
end

# ╔═╡ 275824da-59d8-11eb-1f24-e5ac12dc47f4
md"también escribimos las funciones biológicas:"

# ╔═╡ 67354ee2-59d5-11eb-29f5-e3b9d635cb32
function f₁(z::Complex,c::Complex)
	return(sin(z)+z^2+c)
end

# ╔═╡ a38f0786-59d5-11eb-2d27-7d0b03017150
function f₂(z::Complex,c::Complex)
	return(z^z+z^6+c)
end

# ╔═╡ becbb6e8-59d5-11eb-0142-554065462eb0
function f₃(z::Complex,c::Complex)
	return(z^z+z^5+c)
end

# ╔═╡ cafa8e58-59d5-11eb-189d-1d9858e4bcfc
function f₄(z::Complex,c::Complex)
	return(z^5+c)
end

# ╔═╡ deace162-59d5-11eb-1070-5b96d7d1fcbf
function f₅(z::Complex,c::Complex)
	return(z^3+c)
end

# ╔═╡ 8d13cf48-59d8-11eb-1f00-99359aa33194


# ╔═╡ 70063e56-59d8-11eb-06fa-050bb6f2f816
md"Generamos la función escape que determina el conteo por cada función aplicada que está dentro de los límites de TestC"

# ╔═╡ 7f382c18-59d1-11eb-0ae0-97e6e6e6a6b5
function tiempo_escape(f::Function,z::Complex,c::Complex,Tmax)
	conteo = 0
	if !TestC(z)
		return(conteo)
	end
	
	for i in range(1, step=1, Tmax)
		z = f(z,c)
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

# ╔═╡ 9ce13c80-59d8-11eb-05b8-4380ca81f257
md"generamos una matriz cuadrada para luego graficar los distintos conjuntos"

# ╔═╡ 4f691e90-59d4-11eb-0c48-b369d6cc8ad1
function generar_matriz(f,x,y,c,Tmax)
	colores = [0 for i in x, j in y ]
		a = 1
		for i in x
			b = 1
			for j in y 
				z = i + j*1im
				colores[b,a] = tiempo_escape(f,z,c,Tmax)
				b += 1
			end
			a += 1
		end
	return(colores)
end

# ╔═╡ bb1af862-59d8-11eb-25de-fd0edb4aa11b
md"para obtener una grafica con la matriz cuadrado generamos la siguiente función"

# ╔═╡ 47ae10f2-59d6-11eb-17fd-8b509cafffad
function graficar(x,y, colores, nombre)
	heatmap(x, y, colores, color=cgrad(:tab10, rev = true), 
		    title=nombre, xlabel="Re(z)", ylabel="Im(z)",
		aspectratio=1)
end

# ╔═╡ a20da7d8-59d4-11eb-0d7c-354c455e36d0
begin
	x = -2:0.002:2
	y = -2:0.002:2
	c = 0.279 + 0im
	colores = generar_matriz(fⱼ,x,y,c,40)
	graficar(x,y,colores,"Conjunto de Mandelbrot")
end

# ╔═╡ cb929b78-59d8-11eb-18ce-759562fccfbe
md"Con esto tenemos inicialmente que el conjunto de Mandelbrot es:"

# ╔═╡ d95ca848-59d8-11eb-2454-e9dad45293fb
md"Y para la demás funciones, que son las funciones biológicas obtenemos:"

# ╔═╡ 3f22b668-59d4-11eb-1ca3-a7913d3a7f9c
begin
	colores₁=generar_matriz(f₁,x,y,c,15)
	graficar(x,y,colores₁,"Conjunto de biologico 1")
end

# ╔═╡ 2eb16f16-59d6-11eb-27a6-f5398819c026
begin
	colores₂=generar_matriz(f₂,x,y,c,13)
	graficar(x,y,colores₂,"Conjunto de biologico 2")
end

# ╔═╡ 43933266-59d6-11eb-30fc-af84e35e707d
begin
	colores₃=generar_matriz(f₃,x,y,c,100)
	graficar(x,y,colores₃,"Conjunto de biologico 3")
end

# ╔═╡ e6f8ea90-59d6-11eb-12e9-b501eaa3871f
begin
	colores₄=generar_matriz(f₄,x,y,c,30)
	graficar(x,y,colores₄,"Conjunto de biologico 4")
end

# ╔═╡ f2866e4e-59d6-11eb-1c36-29e11243730d
begin
	colores₅=generar_matriz(f₅,x,y,c,30)
	graficar(x,y,colores₅,"Conjunto de biologico 5")
end

# ╔═╡ Cell order:
# ╟─520ebc66-59d1-11eb-182e-a32905f8da84
# ╠═085b9684-59d1-11eb-1901-dd44f7800da5
# ╟─1af6d394-59d1-11eb-301c-531dda660840
# ╠═173b1e68-59d1-11eb-08b5-f3d76ef11132
# ╟─31ff25fa-59d1-11eb-2e7c-efffc67d936a
# ╠═173b0c8e-59d1-11eb-0940-3b9f41bcf23f
# ╟─275824da-59d8-11eb-1f24-e5ac12dc47f4
# ╠═67354ee2-59d5-11eb-29f5-e3b9d635cb32
# ╠═a38f0786-59d5-11eb-2d27-7d0b03017150
# ╠═becbb6e8-59d5-11eb-0142-554065462eb0
# ╠═cafa8e58-59d5-11eb-189d-1d9858e4bcfc
# ╠═deace162-59d5-11eb-1070-5b96d7d1fcbf
# ╠═8d13cf48-59d8-11eb-1f00-99359aa33194
# ╟─70063e56-59d8-11eb-06fa-050bb6f2f816
# ╠═7f382c18-59d1-11eb-0ae0-97e6e6e6a6b5
# ╟─9ce13c80-59d8-11eb-05b8-4380ca81f257
# ╠═4f691e90-59d4-11eb-0c48-b369d6cc8ad1
# ╟─bb1af862-59d8-11eb-25de-fd0edb4aa11b
# ╠═47ae10f2-59d6-11eb-17fd-8b509cafffad
# ╠═a20da7d8-59d4-11eb-0d7c-354c455e36d0
# ╟─cb929b78-59d8-11eb-18ce-759562fccfbe
# ╟─d95ca848-59d8-11eb-2454-e9dad45293fb
# ╠═3f22b668-59d4-11eb-1ca3-a7913d3a7f9c
# ╠═2eb16f16-59d6-11eb-27a6-f5398819c026
# ╠═43933266-59d6-11eb-30fc-af84e35e707d
# ╠═e6f8ea90-59d6-11eb-12e9-b501eaa3871f
# ╠═f2866e4e-59d6-11eb-1c36-29e11243730d
