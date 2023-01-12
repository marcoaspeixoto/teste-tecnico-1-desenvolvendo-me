require 'rails_helper'

RSpec.describe 'Palindrome' do
  it '1: A string deve ser igual quando invertida' do
    test = Palindrome.new
    is_palindrome = test.palindrome?('arara')
    expect(is_palindrome).to be_truthy
  end

  it '1: A string deve ser diferente quando invertida' do
    test = Palindrome.new
    is_palindrome = test.palindrome?('casa')
    expect(is_palindrome).to be_falsey
  end

  it '1: A string deve ser igual quando invertida' do
    test = Palindrome.new
    is_palindrome = test.palindrome?('Roma me tem amor')
    expect(is_palindrome).to be_truthy
  end
end
