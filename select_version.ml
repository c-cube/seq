
let () =
  let version =
    Scanf.sscanf Sys.argv.(1) "%d.%d" (fun major minor -> (major, minor))
  in
  let file =
    if version < (4, 07) then
      "cp src/seq_redef.ml src/seq.ml; cp src/seq_redef.mli src/seq.mli"
    else
      "cp src/seq_alias.ml src/seq.ml; cp src/seq_alias.mli src/seq.mli"
  in
  print_string file;
  flush stdout

