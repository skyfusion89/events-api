class CreateAccessTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :access_tokens do |t|
      t.string :access_id
      t.string :client_token

      t.timestamps null: false
    end

    add_index :access_tokens, [:access_id], name: "access_id"
  end
end
