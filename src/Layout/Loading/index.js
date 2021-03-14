import React from 'react';


const Spinner = () => (
  <div className="loading-spinner" />
);

const Loading = (props) => (
  <div className={`lazy-inner-loading ${props?.name || ''}`}>
    <Spinner/>
  </div>
);

const LazyLoading = () => (
  <div className="inner-loading">
    <Spinner />
  </div>
);

export {
  Loading,
  LazyLoading,
};
