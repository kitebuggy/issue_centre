module IssueCentre
  class Ticket < ActiveHash::Base
      
    include ActiveHash::Associations
    has_many :events, class_name: 'IssueCentre::Event'

    fields :id, :summary, :date, :dateclosed, :company, :contact,
           :status, :priority, :product, :errortype

  end
end
