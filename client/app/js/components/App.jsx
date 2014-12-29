/** @jsx React.DOM */

var React           = require("react");
var RouteHandler    = require('react-router').RouteHandler;
var Fluxxor         = require('fluxxor');
var FluxMixin       = Fluxxor.FluxMixin(React);
var StoreWatchMixin = Fluxxor.StoreWatchMixin;
var Header          = require('./Header.jsx');

var App = React.createClass({
  mixins: [FluxMixin, StoreWatchMixin('GameStore')],

  getDefaultProps: function() {
    return {
      headerName: 'Battleship'
    }
  },

  getStateFromFlux: function() {
    var flux = this.getFlux();

    console.log(this);

    return {
      gameData: flux.store("GameStore").getState()
    };
  },

  render: function() {
    return (
      <div>
        <Header headerName={this.props.headerName} />
        <RouteHandler gameData={this.state.gameData} />
      </div>
    )
  }
});

module.exports = App;