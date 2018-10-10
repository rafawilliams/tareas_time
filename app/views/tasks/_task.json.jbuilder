json.extract! task, :id, :nombre, :user_id, :hora_inicio, :created_at, :updated_at
json.url task_url(task, format: :json)
