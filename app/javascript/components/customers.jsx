import React from 'react'
import Customer from 'components/customer'
import CustomerForm from 'components/customer_form'

class Customers extends React.Component {
  constructor(props) {
    super();
    this.state = {
      customers: props.data.slice(),
      // customers: [],
    }
  }

  render () {
    const customers = [];
    for (var customer of this.state.customers) {
      customers.push(
        <Customer key={customer.id} customer={customer}/>
      );
    }

    return (
      <div>
        <div className="customers">
          <h2 className="title">Customers</h2>
        </div>
        <CustomerForm/>
        <table className="table">
          <thead>
            <tr>
              <th>Namn</th>
              <th>Telefon</th>
              <th>Address</th>
            </tr>
          </thead>
          <tbody>
            {customers}
          </tbody>
        </table>
      </div>
    );
  };
}

export default Customers;
