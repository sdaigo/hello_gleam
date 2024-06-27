import gleam/io
import gleam/list
import gleam/string

pub fn first_letter(name: String) {
  case name |> string.trim |> string.first {
    Ok(c) -> c
    _ -> ""
  }
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(name: String) {
  name
  |> string.split(on: " ")
  |> list.map(initial)
  |> string.join(with: " ")
}

pub fn pair(full_name1: String, full_name2: String) {
  let names = initials(full_name1) <> "  +  " <> initials(full_name2)
  let lines = [
    "     ******       ******",
    "   **      **   **      **",
    "**            *            **",
    "**                         **",
    "**     " <> names <> "     **",
    " **                       **",
    "   **                   **",
    "     **               **",
    "       **           **",
    "         **       **",
    "           **   **",
    "             ***",
    "              *",
  ]

  io.println(string.join(lines, with: "\n"))
}
