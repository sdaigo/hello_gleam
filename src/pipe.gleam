import gleam/string

pub fn op() {
  "hello"
  |> string.uppercase
  |> string.append("?!")
}

fn add(a: Int, b: Int) {
  a + b
}

pub fn curry() {
  // pass value as first argument
  let _ = 100 |> add(1)

  // pass value as second argument
  let _ = 100 |> add(1, _)
}
