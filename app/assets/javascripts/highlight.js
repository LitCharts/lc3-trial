$(document).ready(function() {
  function modalIsUpdating(modal) {
    return modal.find('input[name="_method"]').val() == 'patch'
  }

  function rebindModalForm(_modal) {
    var modal = $(_modal),
        saveBtn = modal.find('#save-btn'),
        modalBtns = modal.find('.modal-footer .btn');

    saveBtn.unbind('click');
    saveBtn.click(function (){
      if (!this.disabled) {
        modalBtns.prop('disabled', true);
        saveBtn.val('Saving..');
        modal.find('form').submit();
      }
    });

    modal.find('form').off('ajax:success');
    modal.find('form').on('ajax:success', function (_event, response) {
      modal.modal('hide');
      modalBtns.prop('disabled', false);
      modal.find('#save-btn').val('Save');
      if (modalIsUpdating(modal)) {
        $('#' + modal.prop('id') + '-item').replaceWith(response);
      } else {
        $('.highlights-column').append(response);
      }
      rebindModals();
      toastr["success"]('Note saved!');
      $('.highlights-empty-message').hide();
    });

    modal.find('form').off('ajax:error');
    modal.find('form').on('ajax:error', function () {
      alert('There was a problem saving this highlight');
      modalBtns.prop('disabled', false);
      saveBtn.val('Save');
    });
  }

  function rebindModals() {
    $.map($('.highlight-modal'), rebindModalForm);
  }

  rebindModals();

  $(document).on('ajax:success', '.highlight-item .remove-btn', function(){
    $(this).parents('.highlight-item').remove();
    toastr["info"]('Note removed.');
  });
});
