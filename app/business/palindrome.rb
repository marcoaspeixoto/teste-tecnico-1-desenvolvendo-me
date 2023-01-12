class Palindrome
  def palindrome? (string)
    string = string.downcase.scan(/\w/)
    reverse = string.reverse
    reverse == string
  end
end

