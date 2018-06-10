//
// Limitations and areas for improvement:
//
// 1. The text selection does not include markup.
// 2. We're unable to highlight the actual text because of these markup challenges as well.
//    There is potentially a way to figure out how to wrap the text that should be
//    highlighted in a span while respecting other tags that are present.
// 3. The highlights in the right panel of the LitGuide page are not always directly next to
//    the text from which they were derived.
//
$(document).ready(function() {
  $('#text').mouseup(function() {
    var newModal = $('#new-highlight'),
        quote = window.getSelection().toString(),
        form = newModal.find('form');

    if (quote.length > 0) {
      newModal.modal('show');
      newModal.find('#highlight-quote').text(quote);
      form.find('#highlight_note').val('');
      form.find('#highlight_quote').val(quote);

      var startpos = this.textContent.indexOf(quote)
      form.find('#highlight_start_position').val(startpos);
      form.find('#highlight_end_position').val(startpos + quote.length);
    };
  });
});
