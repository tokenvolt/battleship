/** @jsx React.DOM */

var React  = require('react');
var Router = require('react-router');
var Route  = Router.Route;
var DefaultRoute = Router.DefaultRoute;
var NotFoundRoute = Router.NotFoundRoute;
var Redirect = Router.Redirect;

var Fluxxor = require('fluxxor');
var stores  = require('../stores/_index');
var actions = require('../actions/_index');
var flux    = new Fluxxor.Flux(stores, actions);

var App = require('./App.jsx');
var NotFound = require('./NotFound.jsx');
var Board = require('./Board.jsx');

var routes = (
  <Route name="app" path="/" handler={App} flux={flux}>
    <Route path="/games/new" handler={Board}/>
    <NotFoundRoute handler={NotFound}/>
  </Route>
);

Router.run(routes, function (Handler) {
  React.render(<Handler flux={flux} />, document.getElementById('app'));
});

module.exports = routes;