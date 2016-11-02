class C
  include Decorators

  add_prefix('hello ')
  def a
    'from a'
  end

  def b
    'from b'
  end
end

C.new.a # 'hello from a'
C.new.b # 'from b'
