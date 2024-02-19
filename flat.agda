-- Desativando a regra de identidade "K Axiom" e a "Divisão Plana" do compilador
{-# OPTIONS --without-K #-}
{-# OPTIONS --no-flat-split #-}

-- Definindo um módulo chamado "flat"
module flat where

-- Importando "Basics" da biblioteca
open import lib.Basics
 
{- Declarando um tipo de dado chamado "♭", em que "{i : {♭} ULevel}" declara um parâmetro 
que chamamos de "i" que serve de índice para o nível de universo "ULevel", por sua vez
modificado pelo operador comonádico "♭".

Já "(A : {♭} Type i)" é um argumento para o tipo de dado "♭". Ele declara um tipo "A" do
nível de universo "Type i", por sua vez modificado pelo operador "♭". Ou seja, "A" é um
tipo modificado por "♭".

E, por fim, "Type i where" indica a classificação no nível de universo do tipo de dado "♭".
No caso, "♭" está classificado no nível de universo "Type i", ou seja, está no mesmo nível que "A"
-}
data ♭ {i :{♭} ULevel} (A : {♭} Type i) : Type i where
	{- Definindo um construtor de dados chamado "int", que pertence ao tipo de dado "♭".
	Ele é usado para criar valores do tipo de dado "♭".
	
	O "(a : {♭} A)" trata do argumento do construtor "int". Ele declara um argumento "a"
	do tipo "A", por sua vez modificado por "♭".
	
	Por fim, "→ ♭ A" é o retorno do construtor "int". Ele indica que o retorno é um valor
	do tipo "♭ A". Isto é, um valor de tipo "A" modificado pelo operador comonádico "♭".
	-}
	int : (a : {♭} A) → ♭ A
