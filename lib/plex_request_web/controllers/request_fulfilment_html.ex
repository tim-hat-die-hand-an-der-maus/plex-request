defmodule PlexRequestWeb.RequestFulfilmentHTML do
  use PlexRequestWeb, :html

  embed_templates "request_fulfilment_html/*"

  @doc """
  Renders a request_fulfilment form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def request_fulfilment_form(assigns)
end
