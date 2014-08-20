log = (msg) ->
  $('#log').prepend $('<li>').text msg


say = (str) ->
  console.log "say #{str}"
  msg = new SpeechSynthesisUtterance
  voices = speechSynthesis.getVoices()

  msg.voice = voices[10]
  msg.lang = voices[10].lang
  msg.text = str
  speechSynthesis.speak msg


$ ->
  $("#btn_say").on 'click', ->
    say $('#text').val()

