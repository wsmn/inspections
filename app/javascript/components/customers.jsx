import React from 'react'
import Customer from 'components/customer'
import CustomerForm from 'components/customer_form'
import CustomerSearch from 'components/customer_search'

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
    <div className="columns">
      <div className="column is-one-third">
        <div className="customers">
          <h2 className="title">Lägg till ny kund</h2>
          <p/>
          </div>
        <CustomerForm/>
         <br/>
      <h2 className="title">Sök kund:</h2>
        <CustomerSearch/>
        </div>
      <div className="column">
      <h2 className="title">Kunder</h2>
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
      </div>
    </div>
    );
};




}




export default Customers;
