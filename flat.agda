{-# OPTIONS --without-K #-}
{-# OPTIONS --no-flat-split #-}

module flat where

open import lib.Basics
 
data ♭ {i :{♭} ULevel} (A : {♭} Type i) : Type i where
	int : (a : {♭} A) → ♭ A
	
Let-int-u-:=_In_ : {j : ULevel} {i :{♭} Type i} {A :{♭} Type i} {C : ♭ A → Type j}
	→ (X : ♭ A)
	→ ((u :{♭} A) → C (int u))
	→ C x
Let-int-u-:= (int u) In f = f u

ext : {l :{♭} ULevel} {A :{♭} Type l} → (♭ A → A)
ext (int u) = u
