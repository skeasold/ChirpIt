json.posts do
  json.partial! "post", {post: @post}
end
