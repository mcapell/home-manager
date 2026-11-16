function spi --description 'Run pi in nono with Herdr agent discovery'
  # Keep a host-side process carrying HERDR_AGENT in the foreground process group.
  # The explicit exit prevents sh from replacing itself with nono as its final command.
  env HERDR_AGENT=pi sh -c '
    nono run --profile pi --trust-proxy-ca --proxy-ca-validity 7 -- env NODE_OPTIONS=--disable-warning=UNDICI-EHPA pi "$@"
    exit $?
  ' sh $argv
end
