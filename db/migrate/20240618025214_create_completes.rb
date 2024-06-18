class CreateCompletes < ActiveRecord::Migration[7.1]
  def change
    create_table :completes do |t|
      t.string :title
      t.text :description
      t.string :alert_mail_address

      t.timestamps
    end
  end
end
