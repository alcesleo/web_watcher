Hanami::Model.migration do
  up do
    run 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'

    create_table :watchers do
      uuid :id, primary_key: true, default: Sequel.function(:uuid_generate_v4)

      column :url,         String,   null: false
      column :selector,    String,   null: false
      column :description, String,   null: false
      column :email,       String,   null: false
      column :notify,      :boolean, null: false, default: true
      column :active,      :boolean, null: false, default: true
      column :created_at,  DateTime, null: false
      column :updated_at,  DateTime, null: false
    end
  end

  down do
    drop_table :watchers
    run 'DROP EXTENSION IF EXISTS "uuid-ossp"'
  end
end
