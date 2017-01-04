class SnippetResource < JSONAPI::Resource
  immutable
  attributes :slug, :content
end
