import gleam/list

pub fn today(days: List(Int)) -> Int {
  case days {
    [t, ..] -> t
    _ -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [t, ..rest] -> [t + 1] |> list.append(rest)
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case list.find(days, fn(x) { x == 0 }) {
    Ok(_) -> True
    _ -> False
  }
}

pub fn total(days: List(Int)) {
  // list.fold(days, 0, fn(x, y) { x + y })
  case days {
    [] -> 0
    [x] -> x
    [x, ..rest] -> x + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [x, ..rest] ->
      case x {
        x if x >= 5 -> 1 + busy_days(rest)
        _ -> busy_days(rest)
      }
  }
}
