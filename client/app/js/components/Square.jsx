/** @jsx React.DOM */

var React          = require("react");
var Fluxxor        = require('fluxxor');
var FluxChildMixin = Fluxxor.FluxChildMixin(React);

var Square = React.createClass({
  mixins: [FluxChildMixin],

  getDefaultProps: function() {
    return {
      closedColor: '#eafeff'
    }
  },

  getInitialState: function() {
    return {
      selected: false
    }
  },

  render: function() {
    var styles = {
      width:           this.props.side,
      height:          this.props.side,
      backgroundColor: this.props.closedColor,
      float:           "left",
      borderRadius:    '5',
      border:          "1px solid #acacac"
    };

    return (
      <span style={styles}>
      </span>
    )
  }
});

module.exports = Square;