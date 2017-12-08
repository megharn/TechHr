ActiveAdmin.register User do
   permit_params :email,:mobile_no,:first_name,:last_name,:communication_addtrss,:permanent_address,:blood_group,:date_of_birth,:reference_no, :password, :password_confirmation

  index do
    selectable_column
    id_column 
    column :mobile_no   
    column :email

    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
   
 

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at


  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :mobile_no
      f.input :communication_address
      f.input :permanent_address
      f.input :reference_no
      f.input :blood_group
      f.input :date_of_birth, start_year: 1900
      f.input :email

      if f.object.new_record?
       f.input :password
       f.input :password_confirmation
      end
    end
    f.actions
   
  end

end
