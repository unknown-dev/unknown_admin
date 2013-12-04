# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require jquery.ui.all
#= require bootstrap
#= require_tree .

jQuery ->
  if($('.table').length > 0)
    cells = $('.table').find('tr')[0].cells.length
    desired_width = 940 / cells + 'px'
    $('.table td').css('width', desired_width)

  $('#sortable_list').sortable(
    axis: 'y'
    items: '.list-item'
    stop: (e, ui) ->
      ui.item.children('td').effect('highlight', {}, 1000)
    update: (e, ui) ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
      console.log($(this).sortable('serialize'))   
      a = 1   
  )