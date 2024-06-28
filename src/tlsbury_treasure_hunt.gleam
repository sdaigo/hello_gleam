import gleam/list

// convert location
pub fn place_location_to_treasure_location(place_location: #(String, Int)) {
  #(place_location.1, place_location.0)
}

// compare treasure and place location
pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) {
  place_location_to_treasure_location(place_location) == treasure_location
}

// count treasure locations
pub fn count_place_treasures(
  // (place_name, location)
  place: #(String, #(String, Int)),
  // (treasure, location)
  treasures: List(#(String, #(Int, String))),
) {
  treasures
  |> list.filter(fn(treasure) {
    let #(_, place_location) = place
    let #(_, treasure_location) = treasure
    place_location_to_treasure_location(place_location) == treasure_location
  })
  |> list.length
}

// special places
// - The Brass Spyglass can be swapped for any other treasure at the Abandoned Lighthouse.
// - The Amethyst Octopus can be swapped for the Crystal Crab or the Glass Starfish at the Stormy Breakwater.
// - The Vintage Pirate Hat can be swapped for the Model Ship in Large Bottle or the Antique Glass Fishnet Float at the Harbor Managers Office.
pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) {
  case found_treasure.0, place.0, desired_treasure.0 {
    "Brass Spyglass", "Abandoned Lighthouse", _ -> True
    "Amethyst Octopus", "Stormy Breakwater", "Crystal Crab"
    | "Amethyst Octopus", "Stormy Breakwater", "Glass Starfish"
    -> True
    "Vintage Pirate Hat", "Harbor Managers Office", "Model Ship in Large Bottle"
    | "Vintage Pirate Hat",
      "Harbor Managers Office",
      "Antique Glass Fishnet Float"
    -> True
    _, _, _ -> False
  }
}
