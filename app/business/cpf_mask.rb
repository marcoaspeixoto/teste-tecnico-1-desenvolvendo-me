cpf = "461.636.517-23"

if (cpf.match(/^(([0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}))$/))
  puts("match found")
else
  puts("not found")
end
