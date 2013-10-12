json.array!(@votes) do |vote|
  json.extract! vote, :user_id, :in_favor
  json.url vote_url(vote, format: :json)
end
