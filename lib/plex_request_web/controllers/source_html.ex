defmodule PlexRequestWeb.SourceHTML do
  use PlexRequestWeb, :html

  embed_templates "source_html/*"

  @doc """
  Renders a source form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def source_form(assigns)
end
