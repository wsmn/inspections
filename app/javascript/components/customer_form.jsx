import React from 'react';
import PropTypes from 'prop-types';
import CustomerUtils from 'components/customer_utils';


class CustomerForm extends React.Component {
  render() {
    const errors = {};
    if (this.props.errors) {
      Object.keys(this.props.errors).forEach((key) => {
        errors[key] = (
          <p className="help is-danger">
            {this.props.errors[key][0]}
          </p>);
      });
    }

    return (
      <form className="form" onSubmit={this.props.onFormSubmit}>
        <div className="field">
          <label className="label" htmlFor="name">Namn</label>
          <p className="control">
            <input
              className="input"
              type="text"
              placeholder="Namn"
              name="name"
              value={this.props.fields.name}
              onChange={this.props.onInputChange}
            />
          </p>
          {errors.name}

        </div>
        <div className="field">
          <label className="label" htmlFor="phone">Telefon</label>
          <p className="control">
            <input
              className="input"
              type="text"
              placeholder="Telefon"
              name="phone"
              value={this.props.fields.phone}
              onChange={this.props.onInputChange}
            />
          </p>
          {errors.phone}
        </div>
        <div className="field">
          <label className="label" htmlFor="address">Adress</label>
          <p className="control">
            <input
              className="input"
              type="text"
              placeholder="Adress"
              name="address"
              value={this.props.fields.address}
              onChange={this.props.onInputChange}
            />
          </p>
          {errors.address}
        </div>
        <div className="field">
          <label className="label" htmlFor="email">Email</label>
          <p className="control">
            <input
              className="input"
              type="text"
              placeholder="Email"
              name="email"
              value={this.props.fields.email}
              onChange={this.props.onInputChange}
            />
          </p>
          {errors.email}
        </div>
        <div className="field">
          <p className="control">
            <button className="button is-primary" type="submit">
              Skapa Kund
            </button>
          </p>
        </div>
      </form>
    );
  }
}

CustomerForm.propTypes = {
  fields: PropTypes.shape(
    CustomerUtils.propTypesFields(),
  ).isRequired,
  errors: PropTypes.shape({
    address: PropTypes.string,
    email: PropTypes.string,
    name: PropTypes.string,
    phone: PropTypes.string,
  }),
  onInputChange: PropTypes.func.isRequired,
  onFormSubmit: PropTypes.func.isRequired,
};

CustomerForm.defaultProps = {
  errors: {},
};

export default CustomerForm;
