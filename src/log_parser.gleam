import gleam/list
import gleam/option.{Some}
import gleam/regex

pub fn is_valid_line(line: String) {
  case line {
    "[DEBUG]" <> _ | "[INFO]" <> _ | "[WARNING]" <> _ | "[ERROR]" <> _ -> True
    _ -> False
  }
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regex.from_string("<.*?>")
  line |> regex.split(re, _)
}

// Example:
// [INFO] User Alice created a new project
// -> [USER] Alice [INFO] User Alice created a new project
pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(re) = regex.from_string("<[\\~|\\*|=|-]*?>")
  let user =
    line
    |> regex.scan(re, _)
    |> list.map(fn(m) { m.submatches })
    |> list.flatten

  case list.first(user) {
    Ok(Some(n)) -> "[USER] " <> n <> " " <> line
    _ -> line
  }
}
