import calc
import external_functions.{reverse_list}
import gleam/int
import gleam/io
import gleam/list
import high_school_sweetheart as mm

pub fn main() {
  let res = calc.add(20, 22)
  io.println(int.to_string(res))

  let lst = list.range(1, 100)
  let result = int.sum(lst)

  io.println(int.to_string(result))

  mm.pair("Zak Zak", "HAK Hak")

  io.debug(reverse_list([1, 2, 3]))
}
