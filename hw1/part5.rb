class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %{
        def #{attr_name}=(attr_name)
        @#{attr_name} = attr_name
        @#{attr_name}_history = [nil] if @#{attr_name}_history.nil?
        @#{attr_name}_history << attr_name
        end
    }
  end
end

#specs
# On Time 
# single attr_accessor_with_history
  # should return nil as the first element [6 points]
  # should record all past values of the variable, and be able to record for multiple instances [9 points]
  # should record all past values of the variable, and be able to record for multiple variables [15 points]

# multiple attr_accessor_with_history
  # should return nil as the first element [14 points]
  # should record all past values of the variable, and be able to record for multiple instances [21 points]
  # should record all past values of the variable, and be able to record for multiple variables [35 points]

# Finished in 0.00421 seconds
# 6 examples, 0 failures
