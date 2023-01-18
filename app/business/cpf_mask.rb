class CpfMask
  def valid_cpf_mask? (cpf)
    cpf.match?(/^(([0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}))$/)
  end
end
