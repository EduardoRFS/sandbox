Require Import Coq.Logic.Eqdep_dec.

Definition T_Unit : Type := Prop -> Prop.
Definition t_unit : T_Unit := fun x => x.

Definition P_Unit (t_u : T_Unit) : Prop
  := forall P, P t_unit -> P t_u.
Definition p_unit : P_Unit t_unit
  := fun P x => x.

Record Unit : Type := {
  t_u : T_Unit;
  p_u : P_Unit t_u;
  w : t_b
    (forall H : t_u = t_unit,
      p_true = match H with | eq_refl _ => p_b end)
    (forall H : t_b = t_false,
      p_false = match H with | eq_refl _ => p_b end)
}.
Definition true : Bool.
  refine {| t_b := t_true; p_b := p_true; w := _ |}.
  simpl; intros H.
  refine (
    match H with
    | eq_refl =>
  )

  epose (eq_proofs_unicity (t_bool_dec p_true p_true)).
  Check eq_proofs_unicity.

