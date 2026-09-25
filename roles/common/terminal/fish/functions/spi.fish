function spi --wraps='nono run --profile pi -- pi' --description 'alias spi=nono run --profile pi -- pi'
  # nono's proxy makes Node emit a benign UNDICI-EHPA warning before pi starts.
  # Set NODE_OPTIONS inside the sandbox because nono does not pass it through from the shell.
  nono run --profile pi --trust-proxy-ca -- env NODE_OPTIONS=--disable-warning=UNDICI-EHPA pi $argv
end
