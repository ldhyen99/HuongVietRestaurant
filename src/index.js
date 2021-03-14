import React from 'react';
import ReactDOM from 'react-dom';
import './Components/index.css';
import App from './Components/App';
import registerServiceWorker from './registerServiceWorker';
import { Provider } from 'react-redux';
import store from './Components/store';
import { BrowserRouter, HashRouter } from 'react-router-dom';



ReactDOM.render(
  <Provider store={store}>
    <HashRouter>
      <App />
    </HashRouter>
  </Provider>,

  document.getElementById('root')
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
registerServiceWorker();
