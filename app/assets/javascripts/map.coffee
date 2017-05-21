# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $q_year_gteq = $("#q_year_gteq")
  $q_year_lteq = $("#q_year_lteq")
  $map_q_submit = $("#map_q_submit")

  $("#pin_legend_1").click ->
    $q_year_gteq.val ''
    $q_year_lteq.val 1940
    $map_q_submit.click()

  $("#pin_legend_2").click ->
    $q_year_gteq.val 1941
    $q_year_lteq.val 1960
    $map_q_submit.click()

  $("#pin_legend_3").click ->
    $q_year_gteq.val 1961
    $q_year_lteq.val 1980
    $map_q_submit.click()

  $("#pin_legend_4").click ->
    $q_year_gteq.val 1981
    $q_year_lteq.val 2000
    $map_q_submit.click()

  $("#pin_legend_5").click ->
    $q_year_gteq.val 2001
    $q_year_lteq.val ''
    $map_q_submit.click()