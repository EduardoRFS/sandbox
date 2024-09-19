TODO: Find the origin of such a syntax and document it

This syntax is similar to Teika, but not exactly as here I take more freedom, while Teika is more focused on making production better.

```rust
// TODO: vars and meta var ambiguity here
Var (x)
Sort (S)

Term (M, N) ::=
Type (A, B) ::=
  | M : A
  | x
  | A -> B
  | (P : A) -> B
  | P => M
  | M N
// TODO: implicit, intersections, hoisting
Pattern (P) ::=
  | x
  | (P : A)
```