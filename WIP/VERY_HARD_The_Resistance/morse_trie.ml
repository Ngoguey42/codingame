(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   morse_trie.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ngoguey <ngoguey@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/04/27 10:53:28 by ngoguey           #+#    #+#             *)
(*   Updated: 2016/04/27 11:44:16 by ngoguey          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Morse_Trie =
  struct

    let empty = Binary_Trie.empty

    let _dirs_of_char = function
      | 'A' -> [`Left; `Right; ]
      | 'B' -> [`Right; `Left; `Left; `Left; ]
      | 'C' -> [`Right; `Left; `Right; `Left; ]
      | 'D' -> [`Right; `Left; `Left; ]
      | 'E' -> [`Left; ]
      | 'F' -> [`Left; `Left; `Right; `Left; ]
      | 'G' -> [`Right; `Right; `Left; ]
      | 'H' -> [`Left; `Left; `Left; `Left; ]
      | 'I' -> [`Left; `Left; ]
      | 'J' -> [`Left; `Right; `Right; `Right; ]
      | 'K' -> [`Right; `Left; `Right; ]
      | 'L' -> [`Left; `Right; `Left; `Left; ]
      | 'M' -> [`Right; `Right; ]
      | 'N' -> [`Right; `Left; ]
      | 'O' -> [`Right; `Right; `Right; ]
      | 'P' -> [`Left; `Right; `Right; `Left; ]
      | 'Q' -> [`Right; `Right; `Left; `Right; ]
      | 'R' -> [`Left; `Right; `Left; ]
      | 'S' -> [`Left; `Left; `Left; ]
      | 'T' -> [`Right; ]
      | 'U' -> [`Left; `Left; `Right; ]
      | 'V' -> [`Left; `Left; `Left; `Right; ]
      | 'W' -> [`Left; `Right; `Right; ]
      | 'X' -> [`Right; `Left; `Left; `Right; ]
      | 'Y' -> [`Right; `Left; `Right; `Right; ]
      | 'Z' -> [`Right; `Right; `Left; `Left; ]
      | _ -> assert false

    let dirs_of_string str =
      (* Read chars from end to begin *)
      let rec aux i acc =
        if i < 0
        then acc
        else (_dirs_of_char (String.get str i))::acc
             |> aux (i - 1)
      in
      aux (String.length str - 1) []
      |> List.concat


    let insert_string str trie =
      Printf.eprintf "(%s)\n%!" str;
      let dirs = dirs_of_string str in
      let f = function None -> Some 1
                     | Some count -> Some (count + 1)
      in
      Binary_Trie.change ~dirs ~f trie

    class iterator =
    object (self)
      inherit [int, int] Binary_Trie.iterator as super

    end


  end