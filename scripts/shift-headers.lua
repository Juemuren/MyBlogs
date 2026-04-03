-- Decreasing Heading Level
function Header(el)
  if el.level == 1 then
    return {}
  else
    el.level = el.level - 1
    return el
  end
end

-- Keep Inline Comments
function RawInline(el)
  if el.format == "html" and el.text:match("^<!%-%-.*%-%->$") then
    return pandoc.RawInline("markdown", el.text)
  end
end

-- Keep Block Comments
function RawBlock(el)
  if el.format == "html" and el.text:match("^<!%-%-.*%-%->$") then
    return pandoc.RawBlock("markdown", el.text)
  end
end