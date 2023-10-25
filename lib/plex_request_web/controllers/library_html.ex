defmodule PlexRequestWeb.LibraryHTML do
  use PlexRequestWeb, :html

  embed_templates "library_html/*"

  @doc """
  Renders a library form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def library_form(assigns)
end
