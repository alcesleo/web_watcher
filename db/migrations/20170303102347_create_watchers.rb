Hanami::Model.migration do
  change do
    run 'CREATE EXTENSION "uuid-ossp"'

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
end
