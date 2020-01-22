defmodule TodoerWeb.TodoLive do
  use Phoenix.LiveView
  alias Todoer.Todos
  alias TodoerWeb.TodoView

  def mount(_session, socket) do
    Todos.subscribe()
    {:ok, fetch(socket)}
  end

  def render(assigns) do
    TodoView.render("todo.html", assigns)
  end

  def handle_event("add", %{"todo" => todo},  socket) do
    Todos.create_todo(todo)
    
    {:noreply, fetch(socket)}
  end

  def handle_info({Todos, [:todo | _], _ }, socket) do
    {:noreply, fetch(socket)}
  end

  def fetch(socket) do
    assign(socket, todos: Todos.list_todos())
  end
end
