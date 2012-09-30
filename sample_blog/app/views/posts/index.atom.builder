xml.instruct!
xml.feed "xmlns" => "http:/www.w3.org/2005/Atom" do
  xml.title  "Padrino sample blog"
  xml.link   "rel" => "self", "href" => url_for(:posts, :index)
  xml.id     url_for(:posts, :index)
  xml.updated @posts.first.updated_at.strftime "%Y-%m0%dT%H:%M:%SZ" if @posts.any?
  xml.author  { xml.name "padrino team" }

  @posts.each do |post|
    xml.entry do
      xml.title post.title
      xml.link  "rel" => "alternate", "href" => url_for(:posts, :show, :id => post)
      xml.id    url_for(:posts, :show, :id => post)
      xml.updated post.updated_at.strftime "%Y-%m-%dT%H:%M:%SZ"
      xml.authoer { xml.name post.account.email }
      xml.summary post.body
    end
  end
end
