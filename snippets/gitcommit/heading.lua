local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local conds = require 'luasnip.extras.expand_conditions'
local fun = require 'plenary.functional'

-- Function to load the configuration file
local function load_types()
  local config_path = os.getenv 'HOME' .. '/.config/conventional-commit/config'
  local file = io.open(config_path, 'r')
  if not file then
    return {}
  end
  local content = file:read '*a'
  file:close()
  return vim.json.decode(content)
end

local types = load_types()

local function is_breaking(body)
  return fun.any(function(line)
    return string.match(line, 'BREAKING CHANGE:') ~= nil
  end, body)
end

local function emj(typ, scope, subject, body)
  local brk = is_breaking(body)
  typ = brk and 'breaking' or typ
  local dflt = brk and { emoji = ':boom:' } or { emoji = ':pencil2:' }
  local res = (types[typ] or dflt).emoji
  local error_emoji = ':bangbang:'

  if type(res) == 'string' then
    return res
  elseif type(res) == 'table' then
    if res.subject then
      for word in string.gmatch(subject:lower(), '%w+') do
        if res.subject[word] then
          return res.subject[word]
        end
      end
    end
    if res.scope and res.scope[scope] then
      return res.scope[scope]
    end
    return res.default or error_emoji
  end
  return error_emoji
end

local function sp(scope)
  if scope == '' then
    return ''
  else
    return '('
  end
end

local function ss(scope)
  if scope == '' then
    return ''
  else
    return ')'
  end
end

local function bs(body)
  if is_breaking(body) then
    return '!'
  else
    return ''
  end
end

return {}, {
  s({ trig = 'B', name = 'BREAKING CHANGE heading' }, {
    f(function()
      return (types.breaking or { emoji = ':boom:' }).emoji
    end),
    t ' ',
    i(1),
    t '!: ',
    i(2),
    t { '', '', '' },
    i(3),
  }, { condition = conds.line_begin }),

  s({ trig = 'HHH', name = 'Heading' }, {
    f(function(args)
      return emj(args[1][1], args[2][1], args[3][1], args[4])
    end, { 1, 2, 3, 4 }),
    t ' ',
    i(1),
    f(function(args)
      return sp(args[1][1])
    end, { 2 }),
    i(2),
    f(function(args)
      return ss(args[1][1])
    end, { 2 }),
    f(function(args)
      return bs(args[1])
    end, { 4 }),
    t ': ',
    i(3),
    t { '', '', '' },
    i(4),
  }, { condition = conds.line_begin }),
}
