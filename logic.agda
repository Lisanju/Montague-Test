{-# OPTIONS --without-K #-}
{-# OPTIONS --no-flat-split #-}

module logic where

open import lib.Basics
open import lib.types.Pi
open import lib.types.Sigma
open import lib.types.Empty
open import lib.NType
open import lib.NType2
open import lib.types.Truncation

_∧_ : ∀ {i j} (A : hProp i) (B : hProp j) → hProp (lmax i j)
A ∧ B = fst A × fst B , ×-level (snd A) (snd B)

_∨_ : ∀ {i j} (A : hProp i) (B : hProp j) → hProp (lmax i j)
A ∨ B = Trunc -1 (fst A ⊔ fst B) , Trunc-level

not : ∀ {i} (A : hProp i) → hProp i
not A = ¬ (fst A) , Π-level {B = λ _ → ⊥} { -1 } (λ _ → Empty-is-prop)

exists : ∀ {i j} (A : Type i) (B : A → hProp j) → hProp (lmax i j)
exists A B = Trunc -1 (Σ A (fst ∘ B)) , Trunc-level

all : ∀ {i j} (A : Type i) (B : A → hProp j) → hProp (lmax i j)
all A B = Π A (fst ∘ B) , (Π-level {B = (fst ∘ B)} { -1 } (snd ∘ B))
