# Original script from @mence
# In order to work, I had to make a copy of my todo.cfg and place it in .todo/config

command: "/usr/local/Cellar/todo-txt/2.10/bin/todo.sh ls | grep -v TODO | grep -v '^--' "
# todo list priorities in no-color without context or project
# grep inverse match TODO (remove)
# grep inverse match start of string with -- (remove)

refreshFrequency: 100000 # ms

style: """
  // Position the widget on your screen
  top 10px
  left 345px

  // Change the style of the widget
  color #fff
  font-family Helvetica Neue
  background rgba(#000, .35)
  padding 10px 10px 5px
  border-radius 5px

  .container
    position: relative
    clear: both

  .list
    padding-top: 3px
    width=100%

  .list-item
    font-size: 12px
    font-weight: 200
    color: rgba(#fff, .8)
    text-shadow: 0 1px 0px rgba(#000, .1)

  .widget-title
    font-size 12px
    font-weight bold
    color: rgba(#fff, .9)
"""

render: -> """
  <div class="container">
    <div class="widget-title">todo.txt</div>
    <div id="todos" class="list">
    </div>
  </div>
"""

update: (output, domElement) ->

  domElement.innerHTML = '<div class="container"><div class="widget-title">todo.txt</div><div id="todos" class="list"></div></div>'

  todos = output.split('\n')
  list = $(domElement).find('#todos')

  addTodo = (todo) ->
    item = "<div class=\"list-item\">#{todo}</div>"
    list.append item

  if todos.length == 1
    addTodo "Nothing urgent."
  else
    for todo, i in todos
      addTodo todo
