-- Desativando a regra de identidade "K Axiom" e a "Divisão Plana" do compilador.
{-# OPTIONS --without-K #-}
{-# OPTIONS --no-flat-split #-}

-- Definindo um módulo chamado "logic".
module logic where

-- Importando da biblioteca.
open import lib.Basics
open import lib.types.Pi
open import lib.types.Sigma
open import lib.types.Empty
open import lib.NType
open import lib.NType2
open import lib.types.Truncation

-- Definindo os operadores lógicos:

{- Conjunção "∧". Toma duas proposições "A" e "B" que são propriedades homotópicas "hProp", cada uma
com um nível de homotopia diferente, que são "i" e "j". O resultado da conjunção é uma propriedade com nível
de homotopia igual ao máximo entre "i" e "j". A definição utiliza a operação de par (×) para formar o produto
cartesiano das duas proposições e também especifica o nível de homotopia do resultado usando a função ×-level.
-}
_∧_ : ∀ {i j} (A : hProp i) (B : hProp j) → hProp (lmax i j)
A ∧ B = fst A × fst B , ×-level (snd A) (snd B)

{- Disjunção "∨". A estrutura é parecida com a conjunção, mas usa a operação de disjunção (⊔) e a função de
truncamento (Trunc) para garantir que a disjunção esteja definida para tipos arbitrários e seja homotopicamente consistente.
-}
_∨_ : ∀ {i j} (A : hProp i) (B : hProp j) → hProp (lmax i j)
A ∨ B = Trunc -1 (fst A ⊔ fst B) , Trunc-level

{- Negação "not". Toma uma proposição "A" e retorna uma que nega "A". A negação é representada como uma função (¬) que mapeia "A"
para o tipo vazio (⊥). A função Π-level é usada para especificar o nível de homotopia da negação.
-}
not : ∀ {i} (A : hProp i) → hProp i
not A = ¬ (fst A) , Π-level {B = λ _ → ⊥} { -1 } (λ _ → Empty-is-prop)

{- Quantificação existencial "exists". Dado um tipo "A" e uma propriedade homotópica "B" sobre "A", retorna uma propriedade homotópica
indicando que existe algum elemento de "A" que satisfaz "B". Ele usa o tipo sigma (Σ) para formar um par entre um elemento de "A" e a aplicação da propriedade "B" a esse elemento.
-}
exists : ∀ {i j} (A : Type i) (B : A → hProp j) → hProp (lmax i j)
exists A B = Trunc -1 (Σ A (fst ∘ B)) , Trunc-level

{- Quantificação universal "all". Dado um tipo "A" e uma propriedade homotópica "B" sobre "A", retorna uma propriedade homotópica indicando que todos os elementos de "A" satisfazem "B".
Ele usa o tipo de função (Π) para representar a função que mapeia um elemento de "A" para o resultado da aplicação de "B" a esse elemento.
-}
all : ∀ {i j} (A : Type i) (B : A → hProp j) → hProp (lmax i j)
all A B = Π A (fst ∘ B) , (Π-level {B = (fst ∘ B)} { -1 } (snd ∘ B))
