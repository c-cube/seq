
let s0_10 : int Seq.t =
  let rec mk i () =
    if i>10 then Seq.Nil
    else Seq.Cons (i, mk (i+1))
  in
  mk 0

let () =
  let sum = Seq.fold_left (+) 0 s0_10 in
  Printf.printf "sum: %d\n" sum;
  assert (sum = 55)
