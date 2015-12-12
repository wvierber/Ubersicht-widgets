# Inspired by @mence's Todo.txt Widget

command: "/usr/local/Cellar/todo-txt/2.10/bin/todo.sh -d $HOME/Dropbox/todo/todo.cfg -p projectview | tail -n +3"
# todo list by projectview
# remove first two lines

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
    margin-top: 2px;
"""

renderProj: (proj) -> """
  <div class="container">
    <div class="widget-title">#{proj}</div>
  </div>
"""

renderTodo: (todo) -> """
  <div class="container">
    <div class="list-item">#{todo}</div>
  </div>
"""

update: (output, domElement) ->

  projs = output.split('---')

  $(domElement).html ''

  if projs.length == 1
    $(domElement).append @renderTodo("Nothing urgent.")
  else
    for proj in projs
      for todo in proj.split('\n')
        c = todo.charAt(0)
        if  (c >= '0' && c <= '9')
          $(domElement).append @renderTodo(todo)
        else
          $(domElement).append @renderProj(todo)
