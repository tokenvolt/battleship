/** @jsx React.DOM */

var React  = require('react');
var Router = require('react-router');
var Route  = Router.Route;
var Routes = Router.Routes;
var DefaultRoute = Router.DefaultRoute;
var NotFoundRoute = Router.NotFoundRoute;
var Redirect = Router.Redirect;

var Fluxxor = require('fluxxor');
var stores  = require('../stores/_index');
var actions = require('../actions/_index');
var flux    = new Fluxxor.Flux(stores, actions);

var App = require('./App.jsx');
var NotFound = require('./NotFound.jsx');

var routes = (
  <Routes>
    <Route name="app" path="/" handler={App} flux={flux}>
      <NotFoundRoute handler={NotFound}/>
    </Route>
  </Routes>
);

module.exports = routes;