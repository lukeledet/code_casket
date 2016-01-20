defmodule CodeCasket.CodeController do
  use CodeCasket.Web, :controller

  alias CodeCasket.Code

  plug :scrub_params, "code" when action in [:create, :update]

  def index(conn, _params) do
    changeset = Code.changeset(%Code{})
    render conn, "index.html", changeset: changeset
  end

  def show(conn, %{"slug" => slug}) do
    code = Repo.get_by(Code, slug: slug)
    render conn, "show.html", code: code
  end

  def create(conn, %{"code" => code_params}) do
    changeset = Code.changeset(%Code{}, code_params)

    case Repo.insert(changeset) do
      {:ok, code} ->
        conn
        |> put_flash(:info, "Code created successfully.")
        |> redirect(to: code_path(conn, :show, code.slug))
      {:error, changeset} ->
        render(conn, "index.html", changeset: changeset)
    end
  end
end
