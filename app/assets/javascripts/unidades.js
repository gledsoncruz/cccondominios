$(document).ready(function () {


$(document).bind('ajaxError', 'form#new_unidade', function(event, jqxhr, settings, exception){
    $(event.data).formErrors( $.parseJSON(jqxhr.responseText) );

});

$('form#new_unidade').submit(function(event) {
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
        $('#unidadeModal').modal('hide');
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

  });
