module IssueCentre
  class Contact < ActiveHash::Base
      
    include ActiveHash::Associations

    belongs_to :company, class_name: 'IssueCentre::Company'
    fields :id, :company_id, :primary, :notifyoptout, :name, :email,
           :company_name, :tel, :mob

  end
end
