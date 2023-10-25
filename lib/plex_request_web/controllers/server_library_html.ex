defmodule PlexRequestWeb.ServerLibraryHTML do
  use PlexRequestWeb, :html

  embed_templates "server_library_html/*"

  @doc """
  Renders a server_library form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def server_library_form(assigns)
end
