
type id = int


class type account =
  object
    method get_balance : int
    method get_name : string
    method get_id : id
    method update_balance : int -> unit
  end ;;



  class atm_account (n : string) (id_num : id) (b : int) : account =
    object (this)
      val name = n
      val id = id_num
      val mutable balance = b


      method get_balance : int =
        balance

      method get_name : string =
        name

      method get_id : int =
        id

      method update_balance (new_balance : int) : unit =
        balance <- new_balance

  end ;;
