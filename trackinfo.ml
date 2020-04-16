
type id = int

type action =
  | Balance           (* balance inquiry *)
  | Withdraw of int   (* withdraw an amount *)
  | Deposit of int    (* deposit an amount *)
  | Next              (* finish this customer and move on to the next one *)
  | Finished          (* shut down the ATM and exit entirely *)
;;

class type account =
  object
    method get_balance : unit -> int
    method get_name : unit -> string
    method get_id : unit -> id
  end ;;



  class atm_account (n : string) (id_num : id) (b : int) : account =
    object (this)
      val name = n
      val id = id_num
      val mutable balance = b


      method get_balance : unit -> int =
        balance

      method get_name : unit -> string =
        name

      method get_id : unit -> int =
        id




  end ;;
