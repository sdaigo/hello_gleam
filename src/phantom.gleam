// Phantom type
// `unit` is not used in the `Length` value
// so `unit` is phantom type
pub type Length(unit) {
  Length(amount: Float)
}

// this function accepts all Length value
pub fn double(length: Length(unit)) -> Length(unit) {
  Length(length.amount *. 2.0)
}

// A unit type for Inches
// that never constructed
pub type Inches

pub type Meters

// This function will not accept lengths of any other unit 
pub fn add_inch(length: Length(Inches)) -> Length(Inches) {
  Length(length.amount +. 1.0)
}

pub fn add(a: Length(unit), b: Length(unit)) -> Length(unit) {
  Length(a.amount +. b.amount)
}

pub fn main() {
  let two_meters: Length(Meters) = Length(2.0)
  let _two_inches: Length(Inches) = Length(2.0)

  // add(two_meters, two_inches) -> Error
  add(two_meters, two_meters)
}
