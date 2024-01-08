let main () =
  let that = That_library.make 15 in
  Format.printf "that : %s\n%!" (That_library.show that)

let () = main ()
