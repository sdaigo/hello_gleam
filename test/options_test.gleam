import gleam/option.{None, Some}
import gleeunit
import gleeunit/should
import options

pub fn main() {
  gleeunit.main()
}

pub fn say_hello_test() {
  options.say_hello(Some("Aoi"))
  |> should.equal("Hello, Aoi!")

  options.say_hello(None)
  |> should.equal("Hello, Friend!")
}

pub fn say_hello_again_test() {
  options.say_hello_again(Some("Aoi"))
  |> should.equal("Hello, Aoi!")

  options.say_hello_again(None)
  |> should.equal("Hello, Friend!")
}
