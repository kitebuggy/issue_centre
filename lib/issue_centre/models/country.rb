module IssueCentre
  class Country < ActiveHash::Base
      
    include ActiveHash::Associations

    belongs_to :company, class_name: 'IssueCentre::Company'
    
    fields :id, :name, :iso, :is_default

    def self.default
      self.find_by_is_default( true)
    end

  end
end
