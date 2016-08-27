module IssueCentre
  class Event < ActiveHash::Base
      
    include ActiveHash::Associations
    belongs_to :ticket, class_name: 'IssueCentre::Ticket'

    fields :id

  end
end
