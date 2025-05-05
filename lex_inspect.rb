# lex_inspect.rb
require 'ripper'
require 'pp'

code = File.read("sample.rb")
tokens = Ripper.lex(code)

pp tokens
