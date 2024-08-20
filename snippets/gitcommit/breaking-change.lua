local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local conds = require 'luasnip.extras.expand_conditions'

return {}, {
  s({ trig = 'b', name = 'BREAKING CHANGE:' }, {
    t 'BREAKING CHANGE: ',
    i(1),
    t { '', '' },
    i(2),
  }, { condition = conds.line_begin }),
}
