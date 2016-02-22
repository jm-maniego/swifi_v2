module Displayable
  def self.included(klass)
    klass.column_names.each do |column_name|
      define_method "#{column_name}_display" do
        return_value = send(column_name)
        if return_value.present?
          return_value
        else
          "- - -"
        end
      end
    end
  end
end