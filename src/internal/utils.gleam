pub fn get_command_from_lockfile(files: List(String)) -> String {
  case files {
    [] -> "npm"
    [file, ..rest] -> {
      case file {
        "package-lock.json" -> "npm"
        "yarn.lock" -> "yarn"
        "pnpm-lock.yaml" -> "pnpm"
        "bun.lockb" -> "bun"
        _ -> get_command_from_lockfile(rest)
      }
    }
  }
}
