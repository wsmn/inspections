import React from 'react';
import PropTypes from 'prop-types';
import CustomerUtils from 'components/customer_utils';

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

Customer.propTypes = {
  customer: PropTypes.shape(
    CustomerUtils.propTypesModel(),
  ).isRequired,
};

export default Customer;
