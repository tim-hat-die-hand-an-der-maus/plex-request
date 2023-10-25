defmodule PlexRequestWeb.ServerLibraryItemHTML do
  use PlexRequestWeb, :html

  embed_templates "server_library_item_html/*"

  @doc """
  Renders a server_library_item form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def server_library_item_form(assigns)
end
