import gleam/queue

pub fn run() {
  let empty = queue.new()

  queue.push_front(empty, 1)
  queue.push_back(empty, 2)
  queue.push_front(empty, 0)
  // [0, 1, 2]

  let one_to_five = queue.from_list([1, 2, 3, 4, 5])

  let _ = queue.pop_front(one_to_five)
  // Ok(#(1, queue.from_list[2,3,4,5])

  let _ = queue.pop_back(one_to_five)
  // Ok(#(5, queue.from_list[1,2,3,4])
}
