json.array!(@polls) do |poll|
  json.extract! poll, :bill, :question, :creator_id
  json.url poll_url(poll, format: :json)
end
