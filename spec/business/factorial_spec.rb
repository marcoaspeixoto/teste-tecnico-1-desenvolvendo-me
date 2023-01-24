require 'rails_helper'

RSpec.describe 'Calcula fatorial de um número' do
  it '1: Se n < 0 deve retornar nil' do
    test = Factorial.new
    n = -5
    factorial = test.factorial(n)
    expect(factorial).to eq(nil)
  end

  it '2: Se n = 0 deve retornar 1' do
    test = Factorial.new
    n = 0
    factorial = test.factorial(n)
    expect(factorial).to eq(1)
  end

  it '3: Se n > 0 deve retornar n!' do
    test = Factorial.new
    n = 5
    factorial = test.factorial(n)
    expect(factorial).to eq(120)
  end
end
