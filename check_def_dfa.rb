require_relative './dfa/def_dfa'

dfa = DefDFA.new

file_path = "sample.rb"
File.foreach(file_path).with_index(1) do |line, lineno|
  words = line.scan(/\w+/)
  words.each do |word|
    if word.start_with?("d") # `def` の候補っぽい単語だけ検査対象に
      unless dfa.test(word)
        puts "🔍 行#{lineno}: '#{word}' は 'def' の誤記かもしれません"
      end
    end
  end
end
