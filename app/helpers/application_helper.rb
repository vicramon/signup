module ApplicationHelper

  def active_li_link_to(text, path, link_options={})
    active = request.path[/#{polymorphic_path(path)}/] ? 'selected' : ''
    content_tag('li', class: active) do
      link_to text, path, link_options
    end
  end

end
