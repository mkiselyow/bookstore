#= require active_admin/base
$(document).ready ->
  $('#pictureInput').on 'change', (event) ->
    files = event.target.files
    image = files[0]
    reader = new FileReader

    reader.onload = (file) ->
      img = new Image
      console.log file
      img.src = file.target.result
      $('#target').html img
      return

    reader.readAsDataURL image
    console.log files
    return
  return