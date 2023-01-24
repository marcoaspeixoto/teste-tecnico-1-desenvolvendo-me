require 'rails_helper'

RSpec.describe 'Máscara de CPF' do
  it '1: Retorna true se a string está formatada com a máscara de cpf' do
    test = CpfMask.new
    cpf_mask = test.valid_cpf_mask? ('461.636.517-23')
    expect(cpf_mask).to be_truthy
  end
end
