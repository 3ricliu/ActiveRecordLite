require 'byebug'

class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # debugger
    names.each do |name|
      define_method(name) {instance_variable_get("@#{name}")}

      define_method((name.to_s + "=")) {|parameter| instance_variable_set("@#{name}", parameter)}
    end

  end
end
