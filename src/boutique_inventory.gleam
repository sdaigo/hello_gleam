import gleam/iterator.{type Iterator} as iter

pub type Item {
  Item(name: String, price: Int, quantity: Int)
}

pub fn item_names(items: Iterator(Item)) -> Iterator(String) {
  items
  |> iter.map(fn(x) { x.name })
}

pub fn cheap(items: Iterator(Item)) -> Iterator(Item) {
  items
  |> iter.filter(fn(x) { x.price < 30 })
}

pub fn out_of_stock(items: Iterator(Item)) -> Iterator(Item) {
  items
  |> iter.filter(fn(x) { x.quantity == 0 })
}

pub fn total_stock(items: Iterator(Item)) -> Int {
  items
  |> iter.fold(from: 0, with: fn(acc, x) { acc + x.quantity })
}
