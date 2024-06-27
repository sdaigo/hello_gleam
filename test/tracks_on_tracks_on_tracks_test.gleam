import gleeunit
import gleeunit/should
import tracks_on_tracks_on_tracks as m

pub fn main() {
  gleeunit.main()
}

pub fn new_list_test() {
  m.new_list()
  |> should.equal([])
}

pub fn existing_list_test() {
  m.existing_list()
  |> should.equal(["Gleam", "Go", "TypeScript"])
}

pub fn add_language_test() {
  let list = ["Reason", "OCaml"]
  m.add_language(list, "Gleam")
  |> should.equal(["Gleam", "Reason", "OCaml"])
}

pub fn count_languages() {
  let list = ["Reason", "OCaml"]
  m.count_languages(list)
  |> should.equal(2)
}

pub fn reverse_list() {
  m.reverse_list(["Reason", "OCaml"])
  |> should.equal(["OCaml", "Reason"])

  m.reverse_list(["Reason", "OCaml", "Gleam"])
  |> should.equal(["Gleam", "OCaml", "Reason"])
}

pub fn exciting_list() {
  m.exciting_list(["Gleam", "Scheam"])
  |> should.be_true()

  m.exciting_list(["Gleam"])
  |> should.be_true()

  m.exciting_list(["JavaScript", "Gleam"])
  |> should.be_true()

  m.exciting_list(["JavaScript", "Gleam", "Lisp"])
  |> should.be_true()

  m.exciting_list(["JavaScript", "Lisp"])
  |> should.be_false()

  m.exciting_list(["JavaScript", "Lisp", "Gleam"])
  |> should.be_false()
}
