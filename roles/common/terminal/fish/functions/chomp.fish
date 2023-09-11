function chomp -d "remove the last carriage return"
    perl -pi -e 'chomp if eof'
end
