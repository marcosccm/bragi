atom_feed do |feed|
  feed.title("Poem of Bragi")
  feed.updated(Posts.all.last.published_at)

  posts.each do |p|
    feed.entry(p, :url => post_path(p.id), :published => p.published_at, :updated => p.published_at) do |entry|
      entry.title(p.title)
      entry.content(p.body, :type => 'html')
      entry.updated(p.published_at.strftime("%Y-%m-%dT%H:%M:%SZ")) # needed to work with Google Reader.
      entry.author do |author|
        author.name("Marcos Castilho Matos")
      end
    end
  end
end
