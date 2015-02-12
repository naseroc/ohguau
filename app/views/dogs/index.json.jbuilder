json.array!(@dogs) do |dog|
  json.extract! dog, :id, :name, :breed, :age, :size, :sex, :description, :city, :commune, :photo, :nextperiod, :user_id
  json.url dog_url(dog, format: :json)
end
