// Instruction:
// convert a number into its corresponding raindrop sounds.
//
// If a given number:
//
// is divisible by 3, add "Pling" to the result.
// is divisible by 5, add "Plang" to the result.
// is divisible by 7, add "Plong" to the result.
// is not divisible by 3, 5, or 7, the result should be the number as a string.
import gleam/int

pub fn convert(number: Int) -> String {
  let raindrops =
    ""
    |> sound(number, 3, "Pling")
    |> sound(number, 5, "Plang")
    |> sound(number, 7, "Plong")

  case raindrops {
    "" -> int.to_string(number)
    _ -> raindrops
  }
}

fn sound(acc: String, number: Int, divider: Int, sound: String) -> String {
  case number % divider {
    0 -> acc <> sound
    _ -> acc
  }
}
