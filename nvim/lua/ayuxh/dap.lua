require('dap-python').setup('/Users/ayuxh/workplace/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'
require('dap-python').resolve_python = function()
  return '/Users/ayuxh/workplace/PayPolicyExecutionService/env/PayPolicyExecutionService-1.0/test-runtime/bin/python'
end
require("dapui").setup()
