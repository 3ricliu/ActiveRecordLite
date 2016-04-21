require 'byebug'

class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # debugger
    names.each do |name|
      define_method(name) {instance_variable_get("@#{name}")}

      define_method((name.to_s + "=").to_sym) {|parameter| instance_variable_set("@#{name}", parameter)}
    end

  end
end



def unique_items(ary)
    items = Hash.new(0)
    results = []

    ary.each do |num|
        items[num] += 1
    end
    puts results
    items.each do |num|
        results.push(num) if items[num] == 1
    end

    return results

end
