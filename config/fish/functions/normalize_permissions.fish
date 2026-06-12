function normalize_permissions -d "normalize directory (755) and file permissions (644) recursively"
    find $argv[1] -type d -print0 | xargs -0 chmod 755
    find $argv[1] -type f -print0 | xargs -0 chmod 644
end
