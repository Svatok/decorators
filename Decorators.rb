module Decorators
  def self.included(main)
    main.extend DecoratorsMethods
  end

  module DecoratorsMethods
    @prefix, @postfix = '', ''

    def add_prefix(msg)
      @prefix  = msg
    end

    def add_postfix(msg)
      @postfix  = msg
    end

    def method_added(method)
      return if @last_method == method
      origin_method = instance_method(method)
      @last_method = method
      prefix, postfix  = @prefix, @postfix
      @prefix, @postfix = '', ''
      define_method method do
        prefix + origin_method.bind(self).call + postfix
      end
    end
  end
end
