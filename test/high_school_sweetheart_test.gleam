import gleeunit
import gleeunit/should
import high_school_sweetheart as m

pub fn main() {
  gleeunit.main()
}

pub fn first_letter_test() {
  m.first_letter("ZAK")
  |> should.equal("Z")
}

pub fn initial_test() {
  m.initial("ZAK")
  |> should.equal("Z.")
}

pub fn initials_test() {
  m.initials("aoi sh")
  |> should.equal("A. S.")
}
