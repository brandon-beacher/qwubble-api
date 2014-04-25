Sequel.migration do
  up do
    create_table(:answers) do
      primary_key :id
      String :registration_id, null: false
      Integer :question_id, null: false
      String :answer, null: false
      String :image_url, null: false
    end
  end

  down do
    drop_table(:answers)
  end
end
