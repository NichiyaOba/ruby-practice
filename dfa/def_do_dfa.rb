class DefDoDFA
  def initialize
    @transitions = {
      [:q0, 'd'] => :q1,
      [:q1, 'e'] => :q2,
      [:q1, 'o'] => :q4,
      [:q2, 'f'] => :q3,
    }
    @accept_states = [:q3, :q4]
    @start_state = :q0
  end

  def test(input)
    state = @start_state

    input.chars.each_with_index do |char, i|
      if @transitions[[state, char]]
        state = @transitions[[state, char]]
      else
        puts "❌ スペルミス検出！'#{input}' は位置 #{i+1}（文字 '#{char}'）で不正"
        return false
      end
    end

    if @accept_states.include?(state)
      puts "✅ '#{input}' は正しくキーワードとして受理されました"
      true
    else
      puts "❌ '#{input}' は途中まで一致しましたが受理されません（不完全）"
      false
    end
  end
end
