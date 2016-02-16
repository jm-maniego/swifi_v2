# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(->
  init = ->
    init_radio_btns()

  $input_enabled_for    = $('[data-enabled-for]')
  input_enabled_for_ids = $input_enabled_for.map((index, el)-> $(el).data('enabled-for'))
  $radio_btns           = $("input[type=radio]##{Array.prototype.join.call(input_enabled_for_ids, ', #')}")

  init_radio_btns = ->
    unchecked_radio_btn_ids = $radio_btns.filter(->
      !$(this).is(":checked")
      ).map((i, el)-> $(el).attr('id'))
    # debugger
    $inputs_to_disable = $("[data-enabled-for=#{Array.prototype.join.call(unchecked_radio_btn_ids, '], [data-enabled-for=')}]")
    $inputs_to_disable.prop('disabled', true)
    # reinit material select
    $('select').material_select('destroy');
    $('select').material_select();


  init();

  $radio_btns.on('change', ->
    target_id = $(this).attr('id')
    $el       = $("[data-enabled-for=#{target_id}]")
    $el.prop('disabled', false)
    init()
    )
)