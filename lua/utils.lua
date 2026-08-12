local M = {}

-- pcall(require) wrapper: returns the module or nil (no error, no side effects).
-- Use in plugin configs so a missing plugin doesn't halt startup.
function M.safe_require(module)
  local ok, mod = pcall(require, module)
  if not ok then return nil end
  return mod
end

function M.get_python_path(workspace)
  local util = require('lspconfig.util')
  local path = util.path

  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
    return path.join(venv, 'bin', 'python')
  end

  for _, pattern in ipairs({'*', '.*'}) do
    local match_venv = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match_venv ~= '' then
      return path.join(path.dirname(match_venv), 'bin', 'python')
    end
  end

  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

return M
