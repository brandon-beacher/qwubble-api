Sequel.migration do
  up do
    create_table(:registrations) do
      primary_key :id
      String :registration_id, null: false
    end
  end

  down do
    drop_table(:registrations)
  end
end
