import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

fn toggle_player(game: Game) -> Game {
  let new_player = case game.player {
    White -> Black
    Black -> White
  }

  Game(..game, player: new_player)
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let result =
    game
    |> rule1
    // call function on the value inside a result
    |> result.map(rule2)
    // updates an "Ok" result by passing its value
    |> result.try(rule3)
    |> result.try(rule4)

  case result {
    Ok(game) -> toggle_player(game)
    Error(e) -> Game(..game, error: e)
  }
}
