# Weak Induction


```rust
T_Bool
P_Bool :

w_ind :
  (P : (t_b : T_Bool) -> Prop) ->
  P t_true -> P t_false -> P t_b;
ind :
  (P : (t_b : T_Bool) -> P_Bool t_b -> Prop) ->
  P t_true p_true -> P t_false p_false -> P t_b p_b;

(x_true : P_Bool t_true) -> P t_true x_true = P t_true p_true

(K : Type) -> (A -> B -> K) -> K;

f : (f : False) & <P>() -> P(f);

⇑f : (f : ⇑False) & <P>() -> P(f);

(b : <P : _ -> Type l>() -> _) =>
  (x : W b : Type l) => _ 


(b : <P : _ -> Type l>() -> _) =>
  (x : W b : Type l) => _ 

p : (TBool -> TBool -> Type) -> Type;

Bool =
  (A : Type )
Unit = 
  (t_b : TUnit) &
  (p_b : <P>(x : P t_unit) -> P t_b) &
  ;

Unit : Type;
Unit = (u : Unit, i : <A>(x : A) -> A);

Unit : Type;
Unit = (u : Unit) -> (u : Unit, i : <A>(x : A) -> A);


(u : Unit) => u u

t_b => p_b =>
  (P : _ -> Prop) -> P p_b

G |- T : Type
-------------------
G |- f M == f N : T

G |- f : A -> B
G |- A : Type l
G |- B : Type (1 + l)
---------------------
G |- f M == f N

(A : Type 0) -> Type 1
A : Prop
(v : P x) => (v : P y)

Value (V) ::=
  | x ...(V{,*})
  | x => M

Γ, x : Level |- T : Type l
----------------------------------------
Γ |- (x : Level) -> T : Type (l[x := 0])

Γ |- T[x := 0] : Type l[x := 0]
Γ |- T[x := 1] : Type l[x := 1]
Γ |- T[x := 2] : Type l[x := 2] ...
----------------------------------------
Γ |- (x : Level) -> T : Type (l[x := 0])

Γ |- A : Type a  Γ |- B : Type b
--------------------------------
Γ |- A & B : Type (min a b)

Unit : Type 1 = (l : Level) -> (A : Type l) -> (x : A) -> A;
Unitω : (l : Level) -> Type(1 + l);

Unitω = l => Unitω(1 + l) &
  (A : Type(l)) -> (x : A) -> A;

Unit : Type(1) = Unitω(0);

id Unit unit : Unit
id :
  (A : True) -> (x : Prop) -> Prop &
  (A : Prop) -> (x : A) -> A;



(A : Type 4)

Unit =
  (A : Type 0) -> (x : A) -> A &
  ;

Bool = (A : Type 0) -> (x : A) -> (y : A) -> A;
(b : Bool) ->

main :



℘ S === S -> Type;
U : Type = (X : Type) -> (℘℘X -> X) -> ℘℘X;
τ (t : ℘℘U) : U = (X : Type) => (f : ℘℘X -> X) =>
  (p : ℘X) => t ((x : U) => p (f (x X f)));
σ (s : U) : ℘℘U = s U τ;
Ω : U = τ ((p : ℘U) => (x : U) -> σ x p -> p x);


℘ S === (L : Level) -> S -> Type L;

U : Type 1 = (L : Level) -> (X : Type L) -> (℘℘X -> X) -> ℘℘X;
τ (t: ℘℘U) : U = (L : Level) => (X : Type L) => (f : ℘℘X -> X) =>
  (p : ℘X) => t L (L2 => (x : U) => p L2 (f (x L X f)));
σ (s: U) : ℘℘U = s 1 U τ;
∆ = (y: U) => (p: ℘U) -> σ y p -> p (τ (σ y));
Ω : U = τ ((p: ℘U) => (x: U) -> σ x p -> p x);


℘ S === (x : S) -> Type 0;

U : Type 2 =
  (X : Type 1) -> (f : ℘℘X -> X) -> ℘℘X &
  (X : Type 2) -> (f : ℘℘X -> X) -> ℘℘X;
τ (t : ℘℘U) : U = (X : Type 2) => (f : ℘℘X -> X) =>
  (p : ℘X) => t ((x : U) => p (f (x X f)));
σ (s : U) : ℘℘U = s U τ;
Ω : U = τ ((p : ℘U) => (x : U) -> σ x p -> p x);


℘ S === (x : U) -> Type 0;

U : Type 2 =
  (X : Type 1) -> (f : ℘℘X -> X) -> ℘℘X;
τ (t : ℘℘U) : U = (X : Type 1) => (f : ℘℘X -> X) =>
  h(p : ℘X) => t ((x : U) => p (f (x X f)));
σ (s : U) : ⇑℘℘U = ⇑s U τ;
Ω : U = τ ((p : ℘U) => (x : U) -> σ x p -> p x);

Bool : Type;
true : Bool;
false : Bool;

Bool = (b : Bool, i : <P>(x : P true, y : P false) -> P b);

T = (x : A) & B x;

T0 = (x : A, y : B x);
T = (p : T0, w : Heq (fst p) (snd y));

id : (A : Type 0) -> (x : A) -> A
  = (A : Type 0) => (x : A) => x;

```