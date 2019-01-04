class PassageHighlights {
  constructor(passageId) {
    this.passageId = passageId;
    this.highlights = [];
  }

  static serialize(offset) {
    return `${offset.start.toString()}-${offset.end.toString()}`;
  }

  findHighlight(id) {
    return this.highlights.find(function(highlight) {
      return highlight.id == parseInt(id)
    });
  }

  fetchHighlightsForPassage() {
    return $.getJSON(`/passages/${this.passageId}/highlights`, function(data) {
      return data
    }).fail(function (data) {
      console.log(`Could not get highlights for passage ${this.passageId}`)
      return false;
    });
  }
}