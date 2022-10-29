

require('plug')




local schema_setup = require("schemas/setup")
schema_setup.load_scheme('tokyonight-night')
-- schema_setup.load_scheme('gruvbox')



require('config.init')
require('plugin.config.init')
require('lsp.init')

