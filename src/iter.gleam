import gleam/iterator as iter
import gleam/list

pub fn iter_play() {
  list.range(1, 100)
  |> iter.from_list
  |> iter.filter(fn(x) { x % 2 == 0 })
  |> iter.take(10)
  |> iter.to_list
}

pub fn iter_unfold() {
  // generate fibonacci
  iter.unfold(#(0, 1), fn(t) {
    let x = t.0 + t.1
    iter.Next(element: x, accumulator: #(t.1, x))
  })
  // take values from fibonatti values lazily
  |> iter.take(6)
  |> iter.to_list
}
