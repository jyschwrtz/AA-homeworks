import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

import { receiveSearchGiphys, fetchSearchGiphys } from './actions/giphy_actions';
// import { fetchSearchGiphys } from './util/api_util';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');

  window.store = store;
  window.fetchSearchGiphys = fetchSearchGiphys;
  window.receiveSearchGiphys = receiveSearchGiphys;

  ReactDOM.render(<Root store={store} />, rootEl);
});
