json.extract! task, :id, :nombre, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
