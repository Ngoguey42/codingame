(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   task.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ngoguey <ngoguey@student.42.fr>            +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2016/04/23 10:10:36 by ngoguey           #+#    #+#             *)
(*   Updated: 2016/04/23 10:43:13 by ngoguey          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Task =
  struct
    type t = { left : int
             ; right : int
             ; overlap_count : int
             }

    module Event =
      struct
        type info = Start | End
        type t = { day : int
                 ; id : int
                 ; info : info }

        (* Reversed day and day' in compare to get a min_pq of the
         * max_pq implementation *)
        let compare {day; info} {day = day'; info = info'} =
          if day = day' then
            match info, info' with
            | Start, End -> -1
            | End, Start -> 1
            | _, _ -> 0
          else
            day' - day
      end

    module EventPq = BinHeap.Make(Event)

  end