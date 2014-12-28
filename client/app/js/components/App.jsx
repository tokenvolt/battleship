/** @jsx React.DOM */

var React           = require("react");
var Fluxxor         = require('fluxxor');
var FluxMixin       = Fluxxor.FluxMixin(React);
var StoreWatchMixin = Fluxxor.StoreWatchMixin;
var Header          = require('./Header.jsx');

var App = React.createClass({
  // mixins: [FluxMixin, StoreWatchMixin()],

  getDefaultProps: function() {
    return {
      name: 'React-Fluxxor Skeleton'
    }
  },

  // getStateFromFlux: function() {
  //   var flux = this.getFlux();

  //   return {
  //     bookmarks: flux.store("BookmarkStore").getState()
  //   };
  // },

  render: function() {
    return (
      <div>
        <Header name={this.props.name} />
        {this.props.activeRouteHandler()}
      </div>
    )
  }
});

module.exports = App;