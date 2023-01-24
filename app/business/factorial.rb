class Factorial
  def factorial (n)
    if n < 0
      nil
    elsif n == 0
      1
    elsif n > 0
      factor = n - 1
      (1..factor).reverse_each do |i|
        n *= i
      end
      n
    end
  end
end
