require("todo-comments").setup {
  highlight = {
    pattern = [[.*<(KEYWORDS)\s*]],
  },
  search = {
    pattern = [[\b(KEYWORDS)\b]],
  }
}
