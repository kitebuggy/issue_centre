module IssueCentre
  class SessionKey < ActiveHash::Base

    include ActiveHash::Associations
    belongs_to :contract, class_name: 'IssueCentre::Contract'
      
    fields :id, :contract_id, :session_key

  end
end
