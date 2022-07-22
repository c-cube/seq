let () =
  let version =
    Scanf.sscanf Sys.ocaml_version "%d.%d" (fun major minor -> (major, minor))
  in
  if version < (4, 07) then (
    let basename = "seq_redef" in
    let file_in =
      match Sys.argv.(1) with
    | "intf" -> basename ^ ".mli"
    | "impl" -> basename ^ ".ml"
    | _ -> assert false
    in
  let file_out = Sys.argv.(2) in
  let ic = open_in_bin file_in in
  let length = in_channel_length ic in
  let content = really_input_string ic length in
  close_in ic;
  let oc = open_out_bin file_out in
  output_string oc content;
  close_out oc)

