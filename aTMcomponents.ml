(*
                Component Behaviors of an ATM Machine

The functions here represent the component behaviors that an ATM
machine can take, including: prompting for and acquiring from the
customer some information (choosing an action or entering an account
id or an amount); presenting information to the customer; dispensing
cash.

Implementation of these behaviors is likely to require some database
of accounts, each with an id number, a customer name, and a current
balance.
 *)



open Printf

(* Customer account identifiers *)
type id = int

(* Possible actions that an ATM customer can perform *)
type action =
  | Balance           (* balance inquiry *)
  | Withdraw of int   (* withdraw an amount *)
  | Deposit of int    (* deposit an amount *)
  | Next              (* finish this customer and move on to the next one *)
  | Finished          (* shut down the ATM and exit entirely *)
;;


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

(*....................................................................
 Initializing database of accounts
*)

(* A specification of a customer name and initial balance for
   initializing the account database *)
type account_spec = {name : string; id : id; balance : int} ;;

(* initialize accts -- Establishes a database of accounts, each with a
   name, aribtrary id, and balance. The names and balances are
   initialized as per the `accts` provided. *)
let rec initialize (lst: account_spec list) : unit =
  let account_db = ref [] in
  match lst with
  | [] -> ()
  | h :: t -> account_db := !account_db @ [new atm_account h.name h.id h.balance]; initialize t
;;

(*....................................................................
 Acquiring information from the customer
*)

(* acquire_id () -- Requests from the ATM customer and returns an id
   (akin to entering one's ATM card), by prompting for an id number
   and reading an id from stdin. *)
  let acquire_id () : id =
    Printf.printf "Enter customer id: " ;
    read_int () ;

(* acquire_amount () -- Requests from the ATM customer and returns an
   amount by prompting for an amount and reading an int from stdin. *)
let acquire_amount () : int =
  Printf.printf "Enter amount: ";
  read_int();

(* acquire_act () -- Requests from the user and returns an action to
   be performed, as a value of type action *)
  let acquire_act (): action =
    printf "Enter action: (B) Balance (-) Withdraw (+) Deposit (=) Done (X) Exit :";
    let s = read_line () in
    match s with
    | "B" -> Balance
  | "-" -> Withdraw
  | "+" -> Deposit
  | "=" -> Done
  | "X" -> Finished;

(* Possible actions that an ATM customer can perform *)
type action =
  | Balance           (* balance inquiry *)
  | Withdraw of int   (* withdraw an amount *)
  | Deposit of int    (* deposit an amount *)
  | Next              (* finish this customer and move on to the next one *)
  | Finished          (* shut down the ATM and exit entirely *)
(*....................................................................
  Querying and updating the account database

  These functions all raise Not_found if there is no account with the
  given id.
 *)

(* get_balance id -- Returns the balance for the customer account with
   the given id. *)
val get_balance : id -> int ;;

(* get_name id -- Returns the name associated with the customer
   account with the given id. *)
val get_name : id -> string ;;

(* update_balance id amount -- Modifies the balance of the customer
   account with the given id,setting it to the given amount. *)
val update_balance : id -> int -> unit ;;

(*....................................................................
  Presenting information and cash to the customer
 *)

(* present_message message -- Presents to the customer (on stdout) the
   given message followed by a newline. *)
val present_message : string -> unit ;;

(* deliver_cash amount -- Dispenses the given amount of cash to the
   customer (really just prints to stdout a message to that
   effect). *)
val deliver_cash : int -> unit ;;
