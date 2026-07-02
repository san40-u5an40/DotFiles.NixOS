local dap = require('dap')
local dapui = require('dapui')
local virtual_text = require('nvim-dap-virtual-text')

dap.adapters.coreclr = {
  type = 'executable',
  command = 'netcoredbg',
  args = { '--interpreter=vscode' },
  --options = {
  --  external_terminal = {
  --    command = 'alacritty',
  --    args = { '-e' }
  --  }
  --}
}

local config_name = 'launch - netcoredbg'
dap.configurations.cs = {
  {
    type = 'coreclr',
    name = config_name,
    request = 'launch',
    modifiable = true,
    program = function()
      local cwd = vim.fn.getcwd()
      local framework = 'net10.0'

      local project_dll
      if vim.fn.glob(string.format('%s/*.csproj', cwd)) ~= '' then
        local project_name = vim.fn.fnamemodify(cwd, ':t')
        project_dll = string.format('%s/bin/Debug/%s/%s.dll', cwd, framework, project_name)
      else
        local project_name = vim.fn.input('Enter project name: ')
        project_dll = string.format('%s/%s/bin/Debug/%s/%s.dll', cwd, project_name, framework, project_name)
      end

      if vim.fn.filereadable(project_dll) == 1 then
        return project_dll
      else
        error('Project not found')
      end
    end,
    console = "integratedTerminal",
  }
}
dap.listeners.after.event_terminated[config_name] = function(session)
  dapui.close()
  print('Program completed')
end

dapui.setup()
virtual_text.setup()

local build_cmd = '!dotnet build --configuration Debug'

vim.keymap.set('n', '<F5>', function()
  vim.cmd(build_cmd)
  dapui.open()
  dap.continue()
end)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dB', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
vim.keymap.set('n', '<leader>dl', dap.run_last)
vim.keymap.set('n', '<leader>du', dapui.toggle)

vim.keymap.set('n', '<leader>bb', function()
  vim.cmd(build_cmd)
end)
