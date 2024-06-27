import gleam/list

pub fn wines_of_color(wines: List(Wine), color: Color) {
  list.filter(wines, fn(x) { x.color == color })
}

pub fn wines_from_country(wines: List(Wine), country: String) {
  list.filter(wines, fn(x) { x.country == country })
}

pub fn filter(wines: List(Wine), color c: Color, country cn: String) {
  wines
  |> wines_of_color(c)
  |> wines_from_country(cn)
}

pub type Wine {
  Wine(name: String, year: Int, country: String, color: Color)
}

pub type Color {
  Red
  Rose
  White
}
