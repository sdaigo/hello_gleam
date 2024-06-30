import gleam/string

pub opaque type TreasureChest(t) {
  TreasureChest(password: String, treasure: t)
}

pub fn create(password: String, contents: t) -> Result(TreasureChest(t), String) {
  case string.length(password) {
    len if len < 8 -> Error("Password must be at least 8 characters long")
    _ -> Ok(TreasureChest(password, contents))
  }
}

pub fn open(chest: TreasureChest(t), password: String) -> Result(t, String) {
  case chest.password == password {
    True -> Ok(chest.treasure)
    False -> Error("Incorrect password")
  }
}
