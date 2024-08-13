local M = {}

---@param trigger string
---@param body string
local snippet = function(trigger, body)
  return { trigger = trigger, body = body }
end

---@param tbl string[]
function M.lines(tbl)
  return table.concat(tbl, '\n')
end

local global_snippets = {
  snippet('shebang', '#!/bin sh'),
}

local markdown_snippets = {
  snippet(
    '1table',
    M.lines {
      '| ${1:Column1} |',
      '| ------------ |',
      '|  ${2:Item}  |',
      '|  ${3:Item}  |',
    }
  ),
  snippet(
    '2table',
    M.lines {
      '| ${1:Column1} | ${2:Column2} |',
      '| ------------ | ------------ |',
      '|  ${3:Item1}  |  ${4:Item1}  |',
      '|  ${5:Item2}  |  ${6:Item2}  |',
    }
  ),
  snippet(
    '3table',
    M.lines {
      '| ${1:Column1} | ${2:Column2} | ${3:Column3} |',
      '| ------------ | ------------ | ------------ |',
      '|  ${4:Item1}  |  ${5:Item1}  |  ${6:Item1}  |',
      '|  ${7:Item2}  |  ${8:Item2}  |  ${9:Item2}  |',
    }
  ),
  snippet(
    '4table',
    M.lines {
      '| ${1:Column1} | ${2:Column2} | ${3:Column3} | ${4:Column4} |',
      '| ------------ | ------------ | ------------ | ------------ |',
      '|  ${5:Item1}  |  ${6:Item1}  |  ${7:Item1}  |  ${8:Item1}  |',
      '|  ${9:Item2}  | ${10:Item2}  | ${11:Item2}  | ${12:Item2}  |',
    }
  ),
  snippet(
    '5table',
    M.lines {
      '| ${1:Column1} | ${2:Column2} | ${3:Column3} | ${4:Column4} | ${5:Column5} |',
      '| ------------ | ------------ | ------------ | ------------ | ------------ |',
      '|  ${6:Item1}  |  ${7:Item1}  |  ${8:Item1}  |  ${9:Item1}  |  ${10:Item1} |',
      '| ${11:Item2}  | ${12:Item2}  | ${13:Item2}  | ${14:Item2}  |  ${15:Item2} |',
    }
  ),
  snippet(
    '6table',
    M.lines {
      '| ${1:Column1} | ${2:Column2} | ${3:Column3} | ${4:Column4} | ${5:Column5} | ${6:Column6} |',
      '| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |',
      '|  ${7:Item1}  |  ${8:Item1}  |  ${9:Item1}  | ${10:Item1}  | ${11:Item1}  |  ${12:Item1} |',
      '| ${13:Item2}  | ${14:Item2}  | ${15:Item2}  | ${16:Item2}  | ${17:Item2}  |  ${18:Item2} |',
    }
  ),
  snippet(
    '7table',
    M.lines {
      '| ${1:Column1} | ${2:Column2} | ${3:Column3} | ${4:Column4} | ${5:Column5} | ${6:Column6} | ${7:Column7} |',
      '| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |',
      '|  ${8:Item1}  |  ${9:Item1}  | ${10:Item1}  | ${11:Item1}  | ${12:Item1}  |  ${13:Item1} |  ${14:Item1} |',
      '| ${15:Item2}  | ${16:Item2}  | ${17:Item2}  | ${18:Item2}  | ${19:Item2}  |  ${20:Item2} |  ${21:Item2} |',
    }
  ),
  snippet(
    '8table',
    M.lines {
      '| ${1:Column1} | ${2:Column2} | ${3:Column3} | ${4:Column4} | ${5:Column5} | ${6:Column6} | ${7:Column7} | ${8:Column8} |',
      '| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |',
      '|  ${9:Item1}  | ${10:Item1}  | ${11:Item1}  | ${12:Item1}  | ${13:Item1}  |  ${14:Item1} |  ${15:Item1} |  ${16:Item1} |',
      '| ${17:Item2}  | ${18:Item2}  | ${19:Item2}  | ${20:Item2}  | ${21:Item2}  |  ${22:Item2} |  ${23:Item2} |  ${24:Item2} |',
    }
  ),
  snippet(
    '9table',
    M.lines {

      '| ${1:Column1} | ${2:Column2} | ${3:Column3} | ${4:Column4} | ${5:Column5} | ${6:Column6} | ${7:Column7} | ${8:Column8} | ${9:Column8} |',
      '| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |',
      '| ${10:Item1}  | ${11:Item1}  | ${12:Item1}  | ${13:Item1}  | ${14:Item1}  |  ${15:Item1} |  ${16:Item1} |  ${17:Item1} |  ${18:Item1} |',
      '| ${19:Item2}  | ${20:Item2}  | ${21:Item2}  | ${22:Item2}  | ${23:Item2}  |  ${24:Item2} |  ${25:Item2} |  ${26:Item2} |  ${27:Item2} |',
    }
  ),
  snippet(
    '8bittable',
    M.lines {
      '| \\$2^7\\$ | \\$2^6\\$ | \\$2^5\\$ | \\$2^4\\$ | \\$2^3\\$ | \\$2^2\\$ | \\$2^1\\$ | \\$2^0\\$ |',
      '| ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |',
      '| 128   | 64    | 32    | 16    | 8     | 4     | 2     | 1     |',
      '| ${1:0}     | ${2:0}     | ${3:0}     | ${4:0}     | ${5:0}     | ${6:0}     | ${7:0}     | ${8:0}     |',
    }
  ),
  snippet(
    'codeblock',
    M.lines {
      '```${1:language}',
      '$0',
      '```',
    }
  ),
  snippet('note', M.lines { '> [!NOTE]', '> ${0}' }),
  snippet('example', M.lines { '> [!EXAMPLE]', '> ${0}' }),
  snippet('tip', M.lines { '> [!TIP]', '> ${0}' }),
  snippet('important', M.lines { '> [!IMPORTANT]', '> ${0}' }),
  snippet('warning', M.lines { '> [!WARNING]', '> ${0}' }),
  snippet('caution', M.lines { '> [!CAUTION]', '> ${0}' }),
}

local lua_snippets = {}

local snippets_by_filetype = {
  lua = lua_snippets,
  markdown = markdown_snippets,
}

local function get_buf_snips()
  local ft = vim.bo.filetype
  local snips = vim.list_slice(global_snippets)
  if ft and snippets_by_filetype[ft] then
    vim.list_extend(snips, snippets_by_filetype[ft])
  end
  return snips
end
function M.register_source()
  local cmp_source = {}
  local cache = {}
  function cmp_source.complete(_, _, callback)
    local filetype = vim.bo.filetype
    if not cache[filetype] then
      cache[filetype] = vim.tbl_map(function(s)
        ---@type lsp.CompletionItem
        local item = {
          word = s.trigger,
          label = s.trigger,
          kind = vim.lsp.protocol.CompletionItemKind.Snippet,
          insertText = s.body,
          insertTextFormat = vim.lsp.protocol.InsertTextFormat.Snippet,
        }
        return item
      end, get_buf_snips())
    end
    callback(cache[filetype])
  end
  require('cmp').register_source('snp', cmp_source)
end

return M
