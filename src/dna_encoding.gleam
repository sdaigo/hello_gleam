import gleam/list
import gleam/result

pub type Nucleotide {
  // 00
  Adenine
  // 01
  Cytosine
  // 10
  Guanine
  // 11
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0b00
    Cytosine -> 0b01
    Guanine -> 0b10
    Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0b00 -> Ok(Adenine)
    0b1 -> Ok(Cytosine)
    0b10 -> Ok(Guanine)
    0b11 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  dna
  |> list.fold(<<>>, fn(acc, n) { <<acc:bits, { n |> encode_nucleotide }:2>> })
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  case dna {
    <<>> -> Ok([])
    <<n:2, rest:bits>> -> {
      use nuc <- result.try(decode_nucleotide(n))
      use rest_of_bits <- result.map(decode(rest))
      [nuc, ..rest_of_bits]
    }
    _ -> Error(Nil)
  }
}
