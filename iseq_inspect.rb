iseq = RubyVM::InstructionSequence.compile_file("sample.rb")
puts iseq.disasm
