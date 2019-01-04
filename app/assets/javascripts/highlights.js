// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
class Highlight {
  constructor(params) {
    this.id = params.id;
    this.text = params.text;
    this.note = params.note;
    this.offset = params.offset;
    this.passageId = params.passage_id;
  }

  highlightApplier() {
    return rangy.createClassApplier('highlighted', {
      elementAttributes: this.highlightAttributes(),
      onElementCreate: function(element) {
        this.element = element;
        $(element).tooltip({trigger: 'click'});
      }
    });
  }

  highlightedElementRange(highlightedElement) {
    if (this.range) { return this.range }
    var range = rangy.createRange();
    this.range = range.selectCharacters(highlightedElement, this.offset.split('-')[0], this.offset.split('-')[1]);
    return range;
  }

  highlightAttributes() {
    return { 'data-toggle': 'tooltip', 'data-placement': 'top', 'data-html': true, 'title': this.tooltipHtml() }
  }

  tooltipHtml() {
    return `<div highlight-id=${this.id} class='btn-group' role='group'><button type='button' class='btn dehighlight-btn'><span class='glyphicon glyphicon-pencil dehighlight-btn'/></button><button type='button' class='btn btn-secondary note-btn'><span class='glyphicon glyphicon-comment'/></button></div>`;
  }

  save() {
    return $.post(
      '/highlights',
      { highlight: { offset: this.offset, text: this.text, notes: this.note, passage_id: this.passageId } },
      function (data) {
        console.log('Highlight Saved');
        return data;
      }).fail(function() {
        alert("Failed to submit highlight!");
        return false;
    });
  }

  destroy() {
    return $.ajax({
      url: `/highlights/${this.id.toString()}.json`,
      type: 'DELETE',
      data: { id: this.id },
      success: function(data) {
        console.log('Highlight Destroyed');
        return data;
      },
      error: function(data) {
        console.log("Failed to destroy highlight")
        return false; }
    });
  }
}