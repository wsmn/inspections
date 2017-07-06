import React from 'react';
import PropTypes from 'prop-types';
import CustomerForm from 'components/customer_form';
import CustomerSearch from 'components/customer_search';
import CustomersTable from 'components/customers_table';
import CustomerUtils from 'components/customer_utils';

class Customers extends React.Component {
  constructor(props) {
    super();
    this.state = {
      customers: props.data.slice(),
      form: {
        name: '',
        phone: '',
        address: '',
        email: '',
      },
    };

    const tokenElem = document.querySelector('meta[name="csrf-token"]');
    this.token = tokenElem && tokenElem.getAttribute('content');

    this.handleFormInputChange = this.handleFormInputChange.bind(this);
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
  }

  handleFormSubmit(e) {
    e.preventDefault();
    fetch('/customers', {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-Token': this.token,
      },
      body: JSON.stringify({
        customer: this.state.form,
      }),
      credentials: 'same-origin',
    })
      .then(response => response.json())
      .then((data) => {
        if ('customers' in data) {
          this.setState({
            customers: data.customers,
            form: {
              name: '', phone: '', address: '', email: '',
            },
            errors: {},
          });
        } else {
          this.setState({
            errors: data.errors,
          });
        }
      });
  }

  handleFormInputChange(event) {
    const target = event.target;
    const value = target.type === 'checkbox' ? target.checked : target.value;
    const name = target.name;

    const newForm = Object.assign({}, this.state.form);
    newForm[name] = value;

    this.setState({
      form: newForm,
    });
  }

  render() {
    return (
      <div className="columns">
        <div className="column is-one-third">
          <div className="customers">
            <h2 className="title">Lägg till ny kund</h2>
            <CustomerForm
              fields={this.state.form}
              errors={this.state.errors}
              onInputChange={e => this.handleFormInputChange(e)}
              onFormSubmit={e => this.handleFormSubmit(e)}
            />
            <br />
            <h2 className="title">Sök kund:</h2>
            <CustomerSearch />
          </div>
        </div>
        <div className="column">
          <h2 className="title">Kunder</h2>
          <CustomersTable customers={this.state.customers} />
        </div>
      </div>
    );
  }
}

Customers.propTypes = {
  data: CustomerUtils.arrayOf().isRequired,
};

export default Customers;
