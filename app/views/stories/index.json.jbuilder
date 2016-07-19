json.array!(@stories) do |story|
  json.extract! story, :id, :user_id, :authorName, :heading, :body, :published
  json.url story_url(story, format: :json)
end
