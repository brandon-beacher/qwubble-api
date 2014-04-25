Sequel.migration do
  change do
    add_column(:questions, :image_url, :text, null: false)
  end
end
