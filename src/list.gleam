pub fn describe(list: List(String)) -> String {
  case list {
    [] -> "empty"
    [x] -> "list with one item: " <> x
    [x, y] -> "list with two item: " <> x <> " and " <> y
    _ -> "list with three or more"
  }
}

pub fn describe_with_case(list: List(String)) {
  case list {
    [_, _, ..] -> "List with at least two"
    [_] -> "List with one item"
    [] -> "Empty"
  }
}

pub fn remove_first_item(list: List(String)) {
  case list {
    [_, ..rest] -> rest
    // there's no first item to remove
    _ -> []
  }
}
