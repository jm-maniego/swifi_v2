# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(->
  init_radio_btns = ($radio_btns) ->
    unchecked_radio_btn_ids = $radio_btns.filter(->
      !$(this).is(":checked")
      ).map((i, el)-> $(el).attr('id'))

    $inputs_to_disable = $("[data-enabled-for=#{Array.prototype.join.call(unchecked_radio_btn_ids, '], [data-enabled-for=')}]")
    $inputs_to_disable.prop('disabled', true)
    # reinit material select
    $('select').material_select('destroy');
    $('select').material_select();

  $radio_btns = $('[name="job_order[select_client]"], [name="job_order[mode_of_shipment]"')
  if $radio_btns.length > 0

    init_radio_btns($radio_btns)
    $radio_btns.on('change', ->
      target_id = $(this).attr('id')
      $el       = $("[data-enabled-for=#{target_id}]")
      $el.prop('disabled', false)
      init_radio_btns($radio_btns)
      )

  $('ul.tabs li.tab').click((e) ->
    history.replaceState({}, "tabs", e.target.getAttribute("href"))
  )
)