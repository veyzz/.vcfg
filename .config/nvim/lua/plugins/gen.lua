require('gen').setup({
  display_mode = "horizontal-split",
  no_auto_close = true,
})

require('gen').prompts['Generate'] = { prompt = "$input", replace = true }
require('gen').prompts['Chat'] = { prompt = "$input" }
require('gen').prompts['Summarize'] = { 
  prompt = "Прорезюмируй следующий текст:\n$text. Ответ дай на русском языке (код оставь как есть)." 
}
require('gen').prompts['Ask'] = { 
  prompt = "Учитывая следующий текст, $input:\n$text. Ответ дай на русском языке (код оставь как есть)." 
}
require('gen').prompts['Change'] = {
  prompt = "Измени следующий текст согласно: $input. Выведи только итоговый текст без дополнительных кавычек:\n$text",
  replace = true
}
require('gen').prompts['Enhance_Grammar_Spelling'] = {
  prompt = "Улучши грамматику и орфографию в тексте. Выведи только исправленный текст без кавычек:\n$text",
  replace = true
}
require('gen').prompts['Enhance_Wording'] = {
  prompt = "Улучши формулировки в тексте. Выведи только итоговый текст без кавычек:\n$text",
  replace = true
}
require('gen').prompts['Make_Concise'] = {
  prompt = "Сделай текст максимально простым и лаконичным. Выведи только результат без кавычек:\n$text",
  replace = true
}
require('gen').prompts['Make_List'] = {
  prompt = "Преобразуй текст в markdown-список:\n$text",
  replace = true
}
require('gen').prompts['Make_Table'] = {
  prompt = "Оформи текст в виде markdown-таблицы:\n$text",
  replace = true
}
require('gen').prompts['Review_Code'] = {
  prompt = "Проведи ревью кода и предложи лаконичные улучшения:\n```$filetype\n$text\n```. Ответ дай на русском языке (код оставь как есть)."
}
require('gen').prompts['Enhance_Code'] = {
  prompt = "Улучши следующий код. Выведи результат только в формате ```$filetype\n...\n```:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```"
}
require('gen').prompts['Change_Code'] = {
  prompt = "Измени код согласно: $input. Выведи результат только в формате ```$filetype\n...\n```:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```"
}
