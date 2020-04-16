
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
    method name : string
    method id : id
    method balance : int
  end ;;



  class atm_account  =
    object (this)



  end ;;
