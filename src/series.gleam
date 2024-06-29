import gleam/list
import gleam/string

pub type Error {
  SliceLengthZero
  SliceLengthTooLarge
  SliceLengthNegative
  EmptySeries
}

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  let len = input |> string.length

  case len, size {
    0, _ -> Error(EmptySeries)
    _, 0 -> Error(SliceLengthZero)
    _, s if s < 0 -> Error(SliceLengthNegative)
    _, s if s > len -> Error(SliceLengthTooLarge)
    _, _ ->
      input
      |> string.split("")
      |> list.window(size)
      |> list.map(string.join(_, ""))
      |> Ok
  }
}
