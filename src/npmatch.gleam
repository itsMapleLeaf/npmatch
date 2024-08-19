import argv
import gleam/io
import gleam/result
import gleam/string
import shellout
import simplifile

import internal/utils

pub fn main() {
  let assert Ok(current_folder) = simplifile.current_directory()
  let assert Ok(files) = simplifile.read_directory(current_folder)
  let command = utils.get_command_from_lockfile(files)
  let args = argv.load().arguments

  let assert Ok(_) =
    shellout.command(command, with: args, in: current_folder, opt: [
      shellout.LetBeStdout,
      shellout.LetBeStderr,
    ])
}
