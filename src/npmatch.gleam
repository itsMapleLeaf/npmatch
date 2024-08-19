import argv
import gleam/io
import gleam/result
import gleam/string
import gleamyshell
import simplifile

import internal/utils

pub fn main() {
  let assert Ok(current_folder) = simplifile.current_directory()
  let assert Ok(files) = simplifile.read_directory(current_folder)
  let assert Ok(command) =
    utils.get_command_from_lockfile(files) |> gleamyshell.which
  let args = argv.load().arguments
  let assert Ok(output) = gleamyshell.execute(command, in: ".", args:)
  io.println(output.output)
}
