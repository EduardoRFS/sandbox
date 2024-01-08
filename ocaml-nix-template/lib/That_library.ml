open Ppxlib

type that = Parsetree.expression
type t = that

let make n =
  let loc = Location.none in
  let n = Ast_builder.Default.eint ~loc n in
  [%expr
    let n = [%e n] in
    n + 1]

let show = Format.asprintf "%a" Pprintast.expression
