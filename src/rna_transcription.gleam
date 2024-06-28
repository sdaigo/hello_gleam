import gleam/list
import gleam/result
import gleam/string

pub fn to_rna(dna: String) {
  let res =
    dna
    |> string.split("")
    |> list.map(fn(c) {
      case c {
        "G" -> Ok("C")
        "C" -> Ok("G")
        "T" -> Ok("A")
        "A" -> Ok("U")
        "" -> Ok("")
        _ -> Error(Nil)
      }
    })
    |> result.all

  case res {
    Ok(lst) -> Ok(lst |> string.join(""))
    Error(_) -> Error(Nil)
  }
}
