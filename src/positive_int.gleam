pub opaque type PositiveInt {
  PositiveInt(inner: Int)
}

pub fn from_int(i: Int) -> Result(PositiveInt, String) {
  case i {
    _ if i < 0 -> Error("Value must be positive")
    _ -> Ok(PositiveInt(i))
  }
}

pub fn to_int(i: PositiveInt) -> Int {
  i.inner
}
