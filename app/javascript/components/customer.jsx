import React from 'react';

class Customer extends React.Component {
  render() {
    return (
      <tr>
        <td>{this.props.customer.name}</td>
        <td>{this.props.customer.phone}</td>
        <td>{this.props.customer.address}</td>
        <td>{this.props.customer.email}</td>
      </tr>
    );
  }
}

export default Customer;
