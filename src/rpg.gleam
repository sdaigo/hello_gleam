import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

// Stealthy players may be hiding their name and will be introduced as "Mighty Magician"
// otherwise, just use the player's name
pub fn introduce(player: Player) -> String {
  case player.name {
    Some(n) -> n
    _ -> "Mighty Magician"
  }
}

// Check the player's character is indeed dead (health = 0)
// If they are, it should return a new player with 100 health,
// otherwise, character is not dead, return None
pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(health: h, level: l, ..) if h == 0 && l >= 10 ->
      Some(Player(..player, mana: Some(100), health: 100))
    Player(health: h, ..) if h == 0 -> Some(Player(..player, health: 100))
    _ -> None
  }
}

fn decrease_health(n) {
  int.max(0, n)
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    // no mana pool(None) -> damage = 0, decrease health by cost
    None -> #(
      Player(..player, health: decrease_health(player.health - cost)),
      0,
    )
    // spell success -> damage = cost * 2, cusume mana
    Some(m) if m >= cost -> #(Player(..player, mana: Some(m - cost)), cost * 2)
    // insufficient mana -> nothing happens
    Some(m) if cost > m -> #(player, 0)
    _ -> #(player, 0)
  }
}
