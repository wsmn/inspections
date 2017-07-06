import React from 'react';
import PropTypes from 'prop-types';
import CustomerUtils from 'components/customer_utils';
import InputField from 'components/form_utils';


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
        <InputField
          error={errors.name}
          id="name"
          title="Namn"
          onChange={this.props.onInputChange}
          value={this.props.fields.name}
          type="text"
        />
        <InputField
          error={errors.phone}
          id="phone"
          title="Telefon"
          onChange={this.props.onInputChange}
          value={this.props.fields.phone}
          type="tel"
        />
        <InputField
          error={errors.address}
          id="address"
          title="Adress"
          onChange={this.props.onInputChange}
          value={this.props.fields.address}
          type="text"
        />
        <InputField
          error={errors.email}
          id="email"
          title="Email"
          onChange={this.props.onInputChange}
          value={this.props.fields.email}
          type="text"
        />
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
