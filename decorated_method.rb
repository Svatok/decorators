require_relative 'Decorators'

class C
  include Decorators

  add_prefix('hello ')
  add_postfix(' bye')
  def a
    'from a'
  end

  add_prefix('hello ')
  def b
    'from b'
  end

  def c
    'from c'
  end

end

puts C.new.a # 'hello from a bye'
puts C.new.b # 'hello from b'
puts C.new.c # 'from c'
