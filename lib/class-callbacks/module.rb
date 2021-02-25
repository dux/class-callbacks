module ClassCallbacks
  def self.included base
    def base.define_callback name
      ivar = "@class_callbacks_#{name}"

      unless is_a?(Class) || is_a?(Module)
        raise ArgumentError, 'define_callback Can only be defined in a class or a module'
      end

      define_singleton_method(name) do |*args, &block|
        ref = caller[0].split(':in ').first

        self.instance_variable_set(ivar, {}) unless instance_variable_defined?(ivar)
        self.instance_variable_get(ivar)[ref] = block || args
      end
    end
  end

  ###

  def run_callback name, *args
    ivar = "@class_callbacks_#{name}"

    list = is_a?(Class) || is_a?(Module) ? ancestors : self.class.ancestors
    list = list.slice 0, list.index(Object) if list.index(Object)

    list.reverse.each do |klass|
      if klass.instance_variable_defined?(ivar)
        mlist = klass.instance_variable_get(ivar).values
        mlist.each do |m|
          if m.is_a?(Array)
            for el in m
              send el, *args
            end
          else
            instance_exec *args, &m
          end
        end
      end
    end
  end
end
