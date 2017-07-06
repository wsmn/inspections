import React from 'react';
import PropTypes from 'prop-types';
import Customer from 'components/customer';
import CustomerUtils from 'components/customer_utils';

class CustomersTable extends React.Component {
  render() {
    const customers = [];
    this.props.customers.forEach((customer) => {
      customers.push(
        <Customer key={customer.id} customer={customer} />,
      );
    });
    return (
      <table className="table">
        <thead>
          <tr>
            <th>Namn</th>
            <th>Telefon</th>
            <th>Address</th>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          {customers}
        </tbody>
      </table>
    );
  }
}

CustomersTable.propTypes = {
  customers: CustomerUtils.arrayOf().isRequired,
};

export default CustomersTable;
