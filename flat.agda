-- Desativando a regra de identidade "K Axiom" e a "Divisão Plana" do compilador.
{-# OPTIONS --without-K #-}
{-# OPTIONS --no-flat-split #-}

-- Definindo um módulo chamado "flat".
module flat where

-- Importando "Basics" da biblioteca.
open import lib.Basics
 
{- Declarando um tipo de dado chamado "♭", em que "{i : {♭} ULevel}" declara um parâmetro 
que chamamos de "i" que serve de índice para o nível de universo "ULevel", por sua vez
modificado pelo operador comonádico "♭".

Já "(A : {♭} Type i)" é um argumento para o tipo de dado "♭". Ele declara um tipo "A" do
nível de universo "Type i", por sua vez modificado pelo operador "♭". Ou seja, "A" é um
tipo modificado por "♭".

E, por fim, "Type i where" indica a classificação no nível de universo do tipo de dado "♭".
No caso, "♭" está classificado no nível de universo "Type i", ou seja, está no mesmo nível que "A".
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
	
{- Declarando uma função chamada "Let-int-u-:=_In_", em que "A" e "C" são seus argumentos.
"{j : ULevel}" e "{i :{♭} Type i}" são parâmetros que especificam os níveis de universo para
"C" e "A" respectivamente, em que "j" é um nível de universo comum e "i" é um nível de universo
modificado pelo operador comonádico "♭".

"{A :{♭} Type i}" é o argumento "A", é um tipo modificado pelo operador comonádico "♭" parametrizado
pelo nível de universo "i". Já "{C : ♭ A → Type j}" é o argumento "C", é uma função que mapeia valores
do tipo "♭ A" para tipos comuns do nível de universo "j".
-}
Let-int-u-:=_In_ : {j : ULevel} {i :{♭} Type i} {A :{♭} Type i} {C : ♭ A → Type j}
	{- Definindo os argumentos da função "Let-int-u-:=_In_".
	
	"(X : ♭ A)" é o primeiro argumento, chamado "x". Ele é um valor de tipo "♭ A". Ou seja, um valor de
	tipo "A" modificado pelo operador comonádico "♭".
	
	"((u :{♭} A) → C (int u))" é o segundo argumento. É uma função que mapeia valores "u" de tipo "♭ A"
	para valores de tipo "C (int u))". Basicamente é uma função que mapeia valores de tipo "A" para tipo "C",
	em que cada valor de tipo "A" primeiro é transformado na sua forma intensional pelo construtor "int".
	
	"→ C x" é o retorno da função, um valor do tipo "C" aplicado ao valor "x".
	-}
	→ (X : ♭ A)
	→ ((u :{♭} A) → C (int u))
	→ C x
{- Definição da função. Ela diz que quando a função é aplicada a "(int u)" e "f" (o segundo argumento da função maior),
"f" será aplicada a "u". Isso representa a substituição de "let", em que "int u" é substituído por "x" em "C".
-}
Let-int-u-:= (int u) In f = f u

{- Definindo a função chamada "ext", que representará o operador de extensão.

"{l :{♭} ULevel}" é o tipo do primeiro parâmetro da função. Em que "l" é um índice para o nível de universo "ULevel",
modificado pela modalidade comonádica "♭". Isso significa que "l" é um parâmetro que especifica o nível de universo para o tipo "A".

"{A :{♭} Type l}" é o tipo do segundo parâmetro da função. Em que "A" é um tipo modificado por "♭" e é parametrizado pelo nível de 
universo "l".

"→ (♭ A → A)" é o retorno da função, que desfaz a modalidade comonádica "♭". Ou seja, retorna um valor de tipo "A" não modificado.
-}
ext : {l :{♭} ULevel} {A :{♭} Type l} → (♭ A → A)
ext (int u) = u
