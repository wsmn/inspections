import React from 'react';
import PropTypes from 'prop-types';
import DropboxEntry from './entry';
import Utils from '../utils';

class Dropbox extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      hasFolder: true,
      entries: [],
    };
    const tokenElem = document.querySelector('meta[name="csrf-token"]');
    this.token = tokenElem && tokenElem.getAttribute('content');
    this.getEntries = this.getEntries.bind(this);
    this.showContent = this.showContent.bind(this);
    this.createFolder = this.createFolder.bind(this);
    this.getEntries();
  }

  getEntries() {
    fetch('/dropbox/entries',
          Utils.postRequest(this.token, {
            project: this.props.project,
          }),
    )
    .then(response => ((response.ok) ? response.json() : false))
    .then((data) => {
      if (!data) {
        this.setState({
          hasFolder: false,
        });
      } else {
        this.setState({
          entries: data.entries,
          hasFolder: true,
        });
      }
    });
  }

  createFolder() {
    fetch('/dropbox/folder',
          Utils.postRequest(this.token, {
            project: this.props.project,
          }),
    )
    .then(response => ((response.ok) ? response.json() : false))
    .then((data) => {
      if (!data) return;
      this.setState({
        hasFolder: true,
      });
      this.getEntries();
    });
  }

  showContent() {
    if (this.state.hasFolder) {
      const entries = [];
      this.state.entries.forEach((entry) => {
        entries.push(
          <DropboxEntry key={entry.id} entry={entry} project={this.props.project} />,
        );
      });
      if (entries.length === 0) {
        return (<div className="panel-block is-active">Hittade inga filer</div>);
      }
      return (entries);
    } else {
      return (<a className="panel-block" onClick={this.createFolder}>Skapa mapp</a>);
    }
  }

  render() {
    return (
      <nav className="dropbox panel">
        <p className="panel-heading">Dropbox - Project {this.props.project}</p>
        {this.showContent()}
      </nav>
    );
  }
}

Dropbox.propTypes = {
  project: PropTypes.number.isRequired,
};

export default Dropbox;
