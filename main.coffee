log = (msg) ->
  $('#log').prepend $('<li>').text msg


say = (str) ->
  unless SpeechSynthesisUtterance
    log "your browser does not support text-to-speech API"
    return

  msg = new SpeechSynthesisUtterance
  voices = speechSynthesis.getVoices()
  jp_voice = _.find voices, (v) -> v.lang is "ja-JP"

  if jp_voice
    log "say #{str} (#{jp_voice?.name})"
  else
    log "say #{str}"

  msg.voice = jp_voice
  msg.text = str
  speechSynthesis.speak msg


$ ->
  $("#btn_say").on 'click', ->
    say $('#text').val()

  say 'こんにちは'
