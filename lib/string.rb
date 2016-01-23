String.class_eval do
  def upcase
    mb_chars.upcase.to_s
  end
end