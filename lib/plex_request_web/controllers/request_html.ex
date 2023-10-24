defmodule PlexRequestWeb.RequestHTML do
  use PlexRequestWeb, :html

  embed_templates "request_html/*"

  @doc """
  Renders a request form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def request_form(assigns)
end
