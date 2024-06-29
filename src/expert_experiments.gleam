import gleam/result

pub fn with_retry(experiments: fn() -> Result(t, e)) -> Result(t, e) {
  case experiments() {
    Ok(t) -> Ok(t)
    Error(_) -> experiments()
  }
}

pub fn record_timing(
  time_logger: fn() -> Nil,
  experiment: fn() -> Result(t, e),
) -> Result(t, e) {
  time_logger()
  let res = experiment()
  time_logger()

  res
}

pub fn run_experiment(
  name: String,
  setup: fn() -> Result(t, e),
  action: fn(t) -> Result(u, e),
  record: fn(t, u) -> Result(v, e),
) -> Result(#(String, v), e) {
  let res = {
    use setup_data <- result.try(setup())
    use action_data <- result.try(action(setup_data))
    use record_data <- result.map(record(setup_data, action_data))
    record_data
  }

  case res {
    Ok(u) -> Ok(#(name, u))
    Error(e) -> Error(e)
  }
}
