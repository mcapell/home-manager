function rm_sync_conflict -d "Remove syncthing conflict files"
    if test (count $argv) != 1
        echo "Path expected"
        return 1
    end
    find $argv[1] -type f -name "*sync-conflict-*" -exec echo "removing: {}" \; -delete
end
