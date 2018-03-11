fh,err = io.open("db.csv")
if err then print("OOps"); return; end --se o arquivo der problema ele cospe
secs = 2592000  --30 dias em segundos
hoje = os.time()
while true do
  line = fh:read() --para ler linha por linha do arquivo aberto
  if line == nil then break end
  -- print (line)
   teste = string.match(line, '%d$') --jeito meio estranho que achei para ver se tem algum voucher cadastrado, pega o final do arquivo e ve se tem um numero
 --  print (teste)
    usuario = string.match(line, '.-,')
    print (usuario)
    if teste == nil then
      print ('não há voucher cadastrado para o usuario ' .. usuario)
    else
     n = string.sub(line, -28, -19) --aqui eu to catando somente o numero correspondente a data em que o usuario cadastrou o voucher
--   print (n)
     b = tonumber(n)
--     print (b)
    prazo = ((b-hoje)+secs)/86400 --fazendo a conta de quantos dias faltam para acabar o voucher
    print ('o usuario ' ..usuario ..'tem o prazo de ' ..prazo ..' dias para renovar o voucher')
   end
  --    if b == nil then
--           error(line .. " Sem validade")
--    else
--    end
  end
fh:close()
