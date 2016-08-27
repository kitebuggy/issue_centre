module IssueCentre
  class Company < ActiveHash::Base
      
    include ActiveHash::Associations
    has_many :contacts, class_name: 'IssueCentre::Contact'
    has_one  :country, class_name: 'IssueCentre::Country'

    fields :id, :notifyoptout, :notificationDisabled, :name,
           :telephone, :address, :country_id, :ref, :contract, :generic,
           :notes, :fax

  end
end
