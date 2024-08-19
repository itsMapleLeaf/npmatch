import gleeunit/should
import internal/utils

pub fn get_command_from_lockfile_test() {
  utils.get_command_from_lockfile([])
  |> should.equal("npm")

  utils.get_command_from_lockfile(["irrelevant", "files"])
  |> should.equal("npm")

  utils.get_command_from_lockfile(["package-lock.json"])
  |> should.equal("npm")

  utils.get_command_from_lockfile(["yarn.lock"])
  |> should.equal("yarn")

  utils.get_command_from_lockfile(["another", "yarn.lock", "file"])
  |> should.equal("yarn")

  utils.get_command_from_lockfile(["pnpm-lock.yaml"])
  |> should.equal("pnpm")

  utils.get_command_from_lockfile(["another", "pnpm-lock.yaml", "file"])
  |> should.equal("pnpm")

  utils.get_command_from_lockfile(["bun.lockb"])
  |> should.equal("bun")

  utils.get_command_from_lockfile(["another", "bun.lockb", "file"])
  |> should.equal("bun")
}
