import React from 'react';
import PropTypes from 'prop-types';
import Utils from '../utils';

class DropboxEntry extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      link: '#',
    };

    const tokenElem = document.querySelector('meta[name="csrf-token"]');
    this.token = tokenElem && tokenElem.getAttribute('content');
    this.getLink = this.getLink.bind(this);
    this.getLink();
  }

  getLink() {
    fetch('/dropbox/link',
      Utils.postRequest(this.token, {
        project: this.props.project,
        name: this.props.entry.name,
      }),
    )
    .then(response => response.json())
    .then((data) => {
      this.setState({
        link: data.link,
      });
    });
  }

  render() {
    let icon = 'fa fa-file';
    if (this.props.entry['.tag'] === 'folder') {
      icon = 'fa fa-folder';
    }
    return (
      <a
        className="panel-block"
        href={this.state.link}
        target="blank"
      >
        <span className="panel-icon">
          <i className={icon} />
        </span>
        {this.props.entry.name}
      </a>
    );
  }
}

DropboxEntry.propTypes = {
  project: PropTypes.number.isRequired,
  entry: PropTypes.shape(
    {
      '.tag': PropTypes.string.isRequired,
      name: PropTypes.string.isRequired,
    },
  ).isRequired,
};

export default DropboxEntry;
