
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
    method get_balance : unit : int
    method get_name : unit : string
    method get_id : unit : id
  end ;;



  class atm_account (n : string) (id_num : id) (b : int) : shape =
    object (this)
      val mutable name = n
      val mutable id_num = id
      val mutable balance = b



  end ;;
