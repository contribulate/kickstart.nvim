local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local conds = require 'luasnip.extras.expand_conditions'

return {}, {
  s({ trig = 'a', name = 'Co-authored-by:' }, {
    t 'Co-authored-by: ',
    i(1),
    t ' <',
    i(2),
    t { '>', '' },
    i(3),
  }, { condition = conds.line_begin }),
}
