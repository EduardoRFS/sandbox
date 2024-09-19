## Weak Induction

If propositions cannot depend on objects in a lower universe, alá Fω and CoC, then the weak induction principle where only the top universe supports dependent elimination is equivalent to the strong one, where induction is supported in both levels.

It is my understanding that this doesn't contradict the results by Geuvers(Induction Is Not Derivable in Second Order Dependent Type Theory) where he is looking for a unique definition.

But this would state that the weak stratified version already has all the needed proof power.

```rust
// is the same as 
Nat : Type;
zero : Nat;
succ : Nat -> Nat;
ind : (n : Nat) -> (P : Nat -> Type) ->
  P zero -> ((pred : Nat) -> P pred -> P (succ pred)) -> P n;

// can be expanded to
T_Nat : Type = Prop -> (Prop -> Prop) -> Prop;
t_zero : T_Nat = z => s => z;
t_succ (t_pred : T_Nat) : T_Nat = z => s => s (t_pred z s);

P_Nat (t_n : T_Nat) : Prop =
  (P : (t_n : T_Nat) -> Prop) -> P t_zero ->
  ((t_pred : T_Nat) -> P t_pred -> P (t_succ t_pred)) -> P t_n;
p_zero : P_Nat t_zero = P => z => s => z;
p_succ t_pred (p_pred : P_Nat t_pred) =
  P => z => s => s t_pred (p_pred P z s);

ind : (t_n : T_Nat) -> (p_n : P_Nat t_n) ->
  (P : (t_n : T_Nat) -> P_Nat t_n -> Prop) -> P t_zero p_zero ->
  ((t_pred : T_Nat) -> (p_pred : P_Nat t_pred) ->
    P t_pred p_pred -> P (t_succ t_pred) (p_succ p_pred))
  P t_true p_true -> P t_false p_false -> P t_b p_b;
// which is equivalent tho
w_ind : (t_n : T_Nat) -> (p_n : P_Nat t_n) ->
  (P : (t_n : T_Nat) -> Prop) -> P t_zero ->
  ((t_pred : T_Nat) -> P t_pred -> P (t_succ t_pred)) -> P t_n;
```