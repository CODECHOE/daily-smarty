module PostsHelper
  def post_link_formatter(post_link)
    begin
      link = LinkThumbnailer.generate(post_link)
      post_link_mapper(link)
    rescue LinkThumbnailer::Exceptions => e
      content = <<~EOL
                  <div class='card'>
                    <div class='row'>
                      <div class='col-md-12'>
                        <h2>
                          <a href='#{post_link}'>#{post_link}>
                        </h2>
                      </div>
                    </div>
                  </div>
                EOL
      content_tag(:div, content.html_safe, class: 'post-link-wrapper')
    end
  end

  def post_link_mapper(link)
    if !link.videos.empty?
      format_video_link(link)
    elsif !link.images.empty?
      format_image_link(link)
    else
      format_title_link(link)
    end
  end

  def format_title_link(link)
    content = <<~EOL
                <div class='card'>
                  <div class='row'>
                    <div class='col-md-12'>
                      <h2>
                        <a href='#{link.url}' target='_blank'>#{link.title}</a>
                      </h2>
                      <p>#{link.description}</p>
                    </div>
                  </div>
                </div>
              EOL
    content_tag(:div, content.html_safe, class: 'post-link-wrapper')
  end

  def format_video_link(link)
    content = <<~EOL
                <div class='card'>
                  <div class='row'>
                    <div class='col-md-4'>
                      <div>#{link.videos.first.embed_code}</div>
                    </div>
                    <div class='col-md-8'>
                      <h2>
                        <a href='#{link.url}' target='_blank'>#{link.title}</a>
                      </h2>
                      <p>#{link.description}</p>
                    </div>
                  </div>
                </div>
              EOL
    content_tag(:div, content.html_safe, class: 'post-link-wrapper')
  end

  def format_image_link(link)
    content = <<~EOL
                <div class='card'>
                  <div class='row'>
                    <div class='col-md-4'>
                      <img src='#{link.images.first.src.to_s}'>
                    </div>
                    <div class='col-md-8'>
                      <h2>
                        <a href='#{link.url}' target='_blank'>#{link.title}</a>
                      </h2>
                      <p>#{link.description}</p>
                    </div>
                  </div>
                </div>
              EOL
    content_tag(:div, content.html_safe, class: 'post-link-wrapper')
  end
end
