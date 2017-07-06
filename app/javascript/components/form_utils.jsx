import React from 'react';
import PropTypes from 'prop-types';

class InputField extends React.Component {
  render() {
    let error = null;
    if (this.props.error) {
      error = <ErrorField message={this.props.error} />;
    }

    return (
      <div className="field">
        <label className="label" htmlFor="{this.props.id}">{this.props.title}</label>
        <p className="control">
          <input
            className="input"
            type={this.props.type}
            placeholder={this.props.title}
            name={this.props.id}
            value={this.props.value}
            onChange={this.props.onChange}
          />
        </p>
        {error}
      </div>
    );
  }
}

InputField.propTypes = {
  title: PropTypes.string.isRequired,
  type: PropTypes.string.isRequired,
  value: PropTypes.string.isRequired,
  id: PropTypes.string.isRequired,
  onChange: PropTypes.func.isRequired,
  error: PropTypes.string,
};

InputField.defaultProps = {
  error: null,
};

class ErrorField extends React.Component {
  render() {
    return (
      <p className="help is-danger">
        {this.props.message}
      </p>
    );
  }
}

ErrorField.propTypes = {
  message: PropTypes.string.isRequired,
};

export default InputField;
