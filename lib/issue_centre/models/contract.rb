module IssueCentre
  class Contract < ActiveHash::Base
      
    include ActiveHash::Associations
    has_many :session_keys, class_name: 'IssueCentre::SessionKey'

    fields :id, :name
    fields :default_contract, default: false

    def self.default
      self.find_by_default_contract( true) || self.first
    end

  end
end
