/** @jsx React.DOM */

var React     = require("react");
var Square    = require('./Square.jsx');

var Board = React.createClass({
  // board props
  // {
  //   boardLength: Number
  //   squareLength: Number
  // }

  render: function() {
    var styles = {
      width:  this.props.gameData.boardLength * this.props.gameData.squareLength,
      height: this.props.gameData.boardLength * this.props.gameData.squareLength,
      backgroundColor: '#ddd'
    };

    // tile props
    // {
    //   selected: Boolean,
    //   dismissed: Boolean,
    //   color: String
    // }

    console.log(this.props.gameData);

    var board = this.props.gameData.squares.map(function(square) {
      return(<Square side={this.props.gameData.squareLength}
                     selected={square.selected} />)
    }, this)

    return (
      <div className="board" style={styles}>
        {board}
      </div>
    )
  }
});

module.exports = Board;