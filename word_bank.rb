WORDS = ["arity", "new", "collect", "concat", "each", "delete", "first", "flatten", "hash", "pop", "push", "join", "select", "map", "length", "last", "shift", "unshift", "reverse", "rotate", "sample", "sort", "slice", "shuffle", "size", "uniq", "zip", "flatten", "key", "value"]

module Word
  def self.get_new
    WORDS.sample.split("")
  end
end



