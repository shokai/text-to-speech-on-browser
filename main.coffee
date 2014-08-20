log = (msg) ->
  $('#log').prepend $('<li>').text msg


say = (str) ->
  log str
  msg = new SpeechSynthesisUtterance
  voices = speechSynthesis.getVoices()

  jp_voice = _.find voices, (v) -> v.lang is "ja-JP"
  msg.voice = jp_voice
  msg.text = str
  speechSynthesis.speak msg


$ ->
  $("#btn_say").on 'click', ->
    say $('#text').val()

