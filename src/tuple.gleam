import gleam/int

pub fn tpl() {
  let _t2 = #("one", 2)
  let _t3 = #("one", 2, 3.0)

  let person = #("Jordan", 170)
  // person.0
  // person.1

  let #(_name, _length) = person

  case person {
    #(name, length) -> name <> ": " <> int.to_string(length) <> "cm"
  }
}
