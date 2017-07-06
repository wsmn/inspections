import React from 'react';

class CustomerSearch extends React.Component {
  render() {
    return (
      <div className="field has-addons">
        <p className="control">
          <input className="input" type="text" placeholder="Hitta kund" />
        </p>
        <p className="control">
          <a className="button is-info">
            Sök
          </a>
        </p>
      </div>
    );
  }
}

export default CustomerSearch;
