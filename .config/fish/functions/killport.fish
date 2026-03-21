function killport --description 'Kill process at port'
    kill -9 $(whoseport $argv[1])
end
