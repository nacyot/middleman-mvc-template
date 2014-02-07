class MiddlemanController
  # from http://stackoverflow.com/questions/2830368/in-ruby-how-can-i-get-instance-variables-in-a-hash-instead-of-an-array
  def instance_variables_hash
    Hash[instance_variables.map { |name| [name[1..name.length-1].to_sym, instance_variable_get(name)]}]
  end
end
