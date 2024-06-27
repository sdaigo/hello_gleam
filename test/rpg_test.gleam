import gleam/option.{None, Some}
import gleeunit
import gleeunit/should
import rpg

pub fn main() {
  gleeunit.main()
}

pub fn introduce_named_player_test() {
  let player =
    rpg.Player(name: Some("Aoi"), level: 1, health: 10, mana: Some(10))
  rpg.introduce(player)
  |> should.equal("Aoi")
}

pub fn introduce_unnamed_player_test() {
  let player = rpg.Player(name: None, level: 1, health: 10, mana: Some(10))
  rpg.introduce(player)
  |> should.equal("Mighty Magician")
}

pub fn revive_healty_player_test() {
  let player = rpg.Player(name: None, level: 1, health: 42, mana: None)
  rpg.revive(player)
  |> should.equal(None)
}

pub fn revive_non_healty_player_test() {
  let player = rpg.Player(name: None, level: 1, health: 0, mana: None)
  rpg.revive(player)
  |> should.equal(Some(rpg.Player(..player, health: 100)))
}

pub fn cast_spell_players_health_cannot_go_below_0_test() {
  let player = rpg.Player(name: None, level: 5, health: 6, mana: None)

  rpg.cast_spell(player, 12)
  |> should.equal(#(rpg.Player(name: None, level: 5, health: 0, mana: None), 0))
}

pub fn casting_a_spell_with_insufficient_mana_does_none_test() {
  rpg.Player(name: None, level: 5, health: 69, mana: Some(20))
  |> rpg.cast_spell(39)
  |> should.equal(#(
    rpg.Player(name: None, level: 5, health: 69, mana: Some(20)),
    0,
  ))
}
