function flushdns --description 'Force flush dns cache'
    sudo dscacheutil -flushcache
    sudo killall -HUP mDNSResponder
end
