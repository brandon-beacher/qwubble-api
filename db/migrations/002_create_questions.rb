Sequel.migration do
  up do
    create_table(:questions) do
      primary_key :id
      String :registration_id, null: false
      String :question, null: false
    end
  end

  down do
    drop_table(:questions)
  end
end
