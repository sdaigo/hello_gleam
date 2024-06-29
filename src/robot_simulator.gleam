import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  case instructions |> string.split("") {
    [] -> Robot(direction, position)
    [f, ..rest] -> {
      let next = rest |> string.join("")
      case direction {
        North ->
          case f {
            "R" -> move(East, Position(position.x, position.y), next)
            "A" -> move(North, Position(position.x, position.y + 1), next)
            "L" -> move(West, Position(position.x, position.y), next)
            _ -> Robot(direction, position)
          }
        East ->
          case f {
            "R" -> move(South, position, next)
            "A" -> move(East, Position(position.x + 1, position.y), next)
            "L" -> move(North, position, next)
            _ -> Robot(direction, position)
          }
        South ->
          case f {
            "R" -> move(West, position, next)
            "A" -> move(South, Position(position.x, position.y - 1), next)
            "L" -> move(East, position, next)
            _ -> Robot(direction, position)
          }
        West ->
          case f {
            "R" -> move(North, position, next)
            "A" -> move(West, Position(position.x - 1, position.y), next)
            "L" -> move(South, position, next)
            _ -> Robot(direction, position)
          }
      }
    }
  }
}
