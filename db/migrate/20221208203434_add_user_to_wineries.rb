class AddUserToWineries < ActiveRecord::Migration[7.0]
  def change
    add_reference :wineries, :user, index: true
  end
end
