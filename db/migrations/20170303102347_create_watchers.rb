Hanami::Model.migration do
  change do
    run 'CREATE EXTENSION "uuid-ossp"'

    create_table :watchers do
      uuid :id, primary_key: true, default: Sequel.function(:uuid_generate_v4)

      column :url,        String,   null: false
      column :selector,   String,   null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
