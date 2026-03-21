function Header(el)
  -- 删除一级标题
  if el.level == 1 then
    return {}
  else
    -- 其它标题级别减一
    el.level = el.level - 1
    return el
  end
end
