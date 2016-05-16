// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.slimscroll
//= require jquery_nested_form
//= require app

$(document).bind('ajaxError', 'form#new_bloco', function(event, jqxhr, settings, exception){
    $(event.data).formErrors( $.parseJSON(jqxhr.responseText) );
    //console.log('ajaxxxxx');

  });




$('form#new_bloco').submit(function(event) {
    event.preventDefault();
    var valuesToSubmit = $(this).serialize();
    console.log($(this).attr('action'));
    console.log(valuesToSubmit);

    $.ajax({
        url: $(this).attr('action'), //sumbits it to the given url of the form
        data: valuesToSubmit,
        dataType: "JSON",
        type: "POST" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
        //alert('form#'+form_id);
        $('#blocoModal').modal('hide');
        location.reload();

        //$('#msg').remove();
        //$('<div>').attr({ class: 'alert fade in alert-success', id: 'msg' }).html('Unidade Educacional salvo com sucesso').insertAfter( $('#cabecalho') ).fadeIn(200).show();
        //$('#msg').fadeOut(5000);

    }).error(function(jqXHR, textStatus, errorThrown){
        console.log(textStatus + ' - ' + errorThrown);
    });

    return false; // prevents normal behaviour
});

$.fn.formErrors = function(errors){

    $form = $(this);
    $(this).clearErrors();
    model = $(this).data('model');//'bloco';
    acao = $(this).attr('action');
    console.log(acao);

    $.each(errors, function(field, messages){
      $input = $('input[name="' + model + '[' + field + ']"]');
      //$select = $('select[name="' + model + '[' + field + ']"]');
      //console.log($select);
      $input.closest('.form-group').addClass('has-error');
      //$select.closest('.form-group').addClass('has-error');
      $('<spam>').attr({ class: 'help-block' }).insertAfter( $('#'+model+'_'+field) ).html( messages.join(' & ') );
    });

    return false;

  };

  $.fn.clearErrors = function(){
    $('.form-group.has-error', this).each(function(){
      $('.help-block', $(this)).html('');
      $(this).removeClass('has-error');
    });
  }

    $('.form-group.error', this).each(function(){
      $('.help-block', $(this)).html('');
      $(this).removeClass('error');

    });


