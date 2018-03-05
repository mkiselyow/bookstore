$(document).ready ->
  $('input').on 'change', (event) ->
    me = $(this).closest('li')
    files = event.target.files
    image = files[0]
    reader = new FileReader

    reader.onload = (file) ->
      img = new Image
      console.log file
      img.src = file.target.result
      me.html img
      return

    reader.readAsDataURL image
    console.log files
    return
  return