/** @jsx React.DOM */

var React     = require("react");
var Square    = require('./Square.jsx');

var Ship = React.createClass({
  render: function() {
    var styles = {
      width:  this.props.squareLength,
      height: this.props.squareLength,
      backgroundColor: '#111'
    };

    var ship = _.times(this.props.deckCount, function() {
      return(<Square selected={false} />)
    });

    return (
      <div style={styles}>
        {ship}
      </div>
    )
  }
});

module.exports = Ship;