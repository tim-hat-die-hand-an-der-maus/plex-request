defmodule PlexRequestWeb.ServerHTML do
  use PlexRequestWeb, :html

  embed_templates "server_html/*"

  @doc """
  Renders a server form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def server_form(assigns)
end
