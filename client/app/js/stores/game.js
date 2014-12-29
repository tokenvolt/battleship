var _               = require('lodash');
var Fluxxor         = require('fluxxor');
var Constants       = require("../constants");

module.exports = Fluxxor.createStore({
  initialize: function(options) {
    this.boardLength  = 10;
    this.squareLength = 50;
    this.area         = this.boardLength * this.boardLength;

    this.squares = _.times(this.area, function(n) {
      return { id: n + 1, selected: false };
    });

    // this.bindActions(Constants.FLIP_TILE, 'handleFlip');
  },

  getState: function() {
    return {
      squares:      this.squares,
      boardLength:  this.boardLength,
      squareLength: this.squareLength
    };
  }
});