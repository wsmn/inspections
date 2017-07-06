import PropTypes from 'prop-types';

class CustomerUtils {
  static propTypesFields() {
    return {
      address: PropTypes.string.isRequired,
      email: PropTypes.string.isRequired,
      name: PropTypes.string.isRequired,
      phone: PropTypes.string.isRequired,
    };
  }

  static propTypesModel() {
    return {
      address: PropTypes.string.isRequired,
      email: PropTypes.string.isRequired,
      id: PropTypes.number.isRequired,
      name: PropTypes.string.isRequired,
      phone: PropTypes.string.isRequired,
    };
  }

  static arrayOf() {
    return PropTypes.arrayOf(
      PropTypes.shape(this.propTypesModel()),
    );
  }
}

export default CustomerUtils;
