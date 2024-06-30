pub fn count_no_optimisation(list: List(String)) -> Int {
  case list {
    [] -> 0
    [_, ..rest] -> {
      let amount = count_no_optimisation(rest)
      amount + 1
    }
  }
}

// takes just the necessary data and initialize accumulator
pub fn count(list: List(String)) -> Int {
  count_elements(list, 0)
}

fn count_elements(list: List(String), acc: Int) -> Int {
  case list {
    [] -> acc
    [_, ..rest] -> {
      let acc = acc + 1

      // tail recursive call
      count_elements(rest, acc)
    }
  }
}
