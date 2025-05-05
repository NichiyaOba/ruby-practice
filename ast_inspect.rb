require 'ripper'
require 'pp'

code = File.read("sample.rb")
ast = Ripper.sexp(code)

pp ast
