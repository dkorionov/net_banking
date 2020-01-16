module ApplicationHelper
  def bootstrap_class_for(name)
    {success: 'alert-success',
     error: 'alert-danger',
     alert: 'alert-danger',
     notice: 'alert-info',
    }[name.to_sym] || name
  end


  def user_menu
    {name: 'Bill', sub_menu: [
        {name: 'Credits', path: :users_bills, type: 'deposit'},
        {name: 'Deposits', path: :users_bills, type: 'credits'},
        {name: 'New credit', path: :new_users_bill, type: 'deposit'},
        {name: 'New deposit', path: :new_users_bill, type: 'credits'}]}
  end

end
