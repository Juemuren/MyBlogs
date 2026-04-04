local file = PANDOC_STATE.input_files[1]
local path_stem = pandoc.path.split_extension(file)
local stem = pandoc.path.filename(path_stem)

local counters = { tikz = 0, mermaid = 0 }

local function replace_codeblock(key, ext, content)
  counters[key] = counters[key] + 1
  local filename = string.format("%s-%s-%d.%s", path_stem, key, counters[key], ext)
  pandoc.system.write_file(filename, content)
  local caption = string.format("%s-%s-%d", stem, key, counters[key])
  local path = string.format("%s-%s-%d.svg", stem, key, counters[key])
  local img = pandoc.Image({pandoc.Str(caption)}, path)
  return pandoc.Para({img})
end

-- Extract Codeblock into Standalone
function CodeBlock(el)
  local class = el.classes and el.classes[1]
  if class == "tikz" then
    local pre = [[
\documentclass[tikz]{standalone}
\usepackage{tikz}
\begin{document}
]]
    local post = [[
\end{document}
]]
    return replace_codeblock("tikz", "tex", pre .. el.text .. post)
  elseif class == "mermaid" then
    return replace_codeblock("mermaid", "mmd", el.text)
  else
    return nil
  end
end