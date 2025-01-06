print("load toggleterm")

require("toggleterm").setup{
  size = 8,
  open_mapping = [[<C-\>]],
  direction = 'horizontal',  -- 使用浮動終端
  close_on_exit = true,     -- 當終端退出時自動關閉窗口
  shade_terminals = true,   -- 讓終端窗口的顏色稍微變暗，以區分普通編輯區域
  shading_factor = '-30',
  shading_ratio = '-3',
}

