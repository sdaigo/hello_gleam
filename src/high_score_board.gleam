import gleam/dict.{type Dict}

pub type ScoreBoard =
  Dict(String, Int)

pub fn create_score_board() {
  let score_board = dict.new()
  dict.insert(score_board, "The Best Ever", 1_000_000)
}

pub fn add_player(score_board: ScoreBoard, player: String, score: Int) {
  dict.insert(score_board, player, score)
}

pub fn remove_player(score_board: ScoreBoard, player: String) {
  dict.drop(score_board, [player])
}

pub fn update_score(score_board: ScoreBoard, player: String, points: Int) {
  case dict.get(score_board, player) {
    Ok(score) -> dict.insert(score_board, player, score + points)
    _ -> score_board
  }
}

pub fn apply_monday_bonus(score_board: ScoreBoard) {
  score_board
  |> dict.map_values(fn(_, v) { v + 100 })
}
