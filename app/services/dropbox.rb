# frozen_string_literal: true

class Dropbox
  def create_folder(path)
    client.create_folder(to_p(path))
  end

  def entries(path)
    client.list_folder(to_p(path)).entries
  end

  def link(path)
    link = client.list_shared_links(path: to_p(path)).links.first
    link = client.create_shared_link_with_settings(to_p(path)) if link.nil?
    link
  end

  private

  def to_p(path)
    "/projects/#{path}"
  end

  def client
    @client ||= DropboxApi::Client.new
  end
end
