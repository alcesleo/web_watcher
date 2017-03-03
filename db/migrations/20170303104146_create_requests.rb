Hanami::Model.migration do
  change do
    create_table :requests do
      uuid :id, primary_key: true, default: Sequel.function(:uuid_generate_v4)

      foreign_key :watcher_id, :watchers, type: :uuid, null: false

      column :value,       String,   null: false
      column :status_code, Integer,  null: false
      column :created_at,  DateTime, null: false
    end
  end
end
