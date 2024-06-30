pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(p) -> 1 + pizza_price(p)
    ExtraToppings(p) -> 2 + pizza_price(p)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  calc_orders(order, calc_extra_fee(order))
}

fn calc_orders(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [pizza, ..rest] -> {
      calc_orders(rest, acc + pizza_price(pizza))
    }
  }
}

fn calc_extra_fee(order: List(Pizza)) -> Int {
  case order {
    [_] -> 3
    [_, _] -> 2
    _ -> 0
  }
}
