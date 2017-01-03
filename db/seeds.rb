class ScanSnippets
  def initialize(dir)
    @dir = dir
  end

  def to_json
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    Dir.glob("#{@dir}/*.md").map { |f|
      file_name = f.split('/').last
      lang = file_name.split('.')[0]
      md = markdown.render(File.read(f))
      {
        file_name: file_name,
        lang: lang,
        md: md
      }
    }.inject({}) {|col, n|
      col[n[:lang].to_sym] = n[:md]
      col
    }.to_json
  end
end

snippets = Dir.glob('snippets/*').select { |f|
  File.directory? f
}.map { |f|
  {
    dir: f,
    slug: f.split('/')[1]
  }
}

snippets.each do |snippet|
  query = Snippet.where(slug: snippet[:slug])
  new_snippt = nil

  if query.length > 0
    new_snippet = query.first
  else
    new_snippet = Snippet.new(
      slug: snippet[:slug]
    )
  end

  new_snippet.content = ScanSnippets.new(snippet[:dir]).to_json
  new_snippet.save!
end
