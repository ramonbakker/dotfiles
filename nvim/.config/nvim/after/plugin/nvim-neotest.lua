require('neotest').setup({
    adapters = {
        require('neotest-vstest')({
            dap_settings = {
                type = 'coreclr'
            }
        })
    },
})
