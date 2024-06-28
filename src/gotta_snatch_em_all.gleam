import gleam/list
import gleam/result
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.new()
  |> set.insert(card)
}

pub fn add_card(collection: Set(String), card: String) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(my_card: String, their_card: String, collection: Set(String)) {
  #(
    set.contains(collection, my_card) && !set.contains(collection, their_card),
    collection |> set.delete(my_card) |> set.insert(their_card),
  )
}

pub fn boring_cards(collections: List(Set(String))) {
  collections
  |> list.reduce(set.intersection)
  |> result.unwrap(or: set.new())
  |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) {
  collections
  |> list.fold(set.new(), set.union)
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) {
  collection
  |> set.filter(fn(c) { c |> string.starts_with("Shiny ") })
}
