import gleam/list

// returns new empty list
pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) {
  [language, ..languages]
}

pub fn count_languages(languages: List(String)) {
  list.length(languages)
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  list.reverse(languages)
}

pub fn exciting_list(language: List(String)) -> Bool {
  case language {
    ["Gleam", ..] -> True
    [_, "Gleam"] | [_, "Gleam", _] -> True
    _ -> False
  }
}
