import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';

import { StarWarsApp } from './StarWarsApp';
import './styles.css';
import { GlobalLoading } from 'react-global-loading';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <BrowserRouter>
      <GlobalLoading/>
      <StarWarsApp />
    </BrowserRouter>
  </React.StrictMode>
);
