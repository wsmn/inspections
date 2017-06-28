import React from 'react';

class CustomerForm extends React.Component {
  constructor() {
    super();
    const token_elem = document.querySelector('meta[name="csrf-token"]');
    this.token = token_elem && token_elem.getAttribute("content");
    this.state = {
      name: '',
      phone: '',
      address: '',
      email: '',
    }

    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInputChange(event) {
    const target = event.target;
    const value = target.type === 'checkbox' ? target.checked : target.value;
    const name = target.name;

    this.setState({
      [name]: value
    });
  }

  handleSubmit(e) {
    e.preventDefault();
    fetch("/customers", {
      method: "post",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-Token': this.token,
      },
      body: JSON.stringify({
        customer: this.state,
      }),
      credentials: 'same-origin'
    });
  }

  valid(e) {
    // return this.state.name && this.state.phone && this.state.address && this.state.email;
    return this.state.name;
  }

  render() {
    return (
      <form className="form" onSubmit={this.handleSubmit}>
        <div className="field">
          <label className="label">Namn</label>
          <p className="control">
            <input className="input"
                   type="text"
                   placeholder="Namn"
                   name="name"
                   value={this.state.name}
                   onChange={this.handleInputChange}/>
          </p>
        </div>
        <div className="field">
          <label className="label">Telefon</label>
          <p className="control">
            <input className="input"
                   type="text"
                   placeholder="Telefon"
                   name="phone"
                   value={this.state.phone}
                   onChange={this.handleInputChange}/>
          </p>
        </div>
        <div className="field">
          <label className="label">Adress</label>
          <p className="control">
            <input className="input"
                   type="text"
                   placeholder="Adress"
                   name="address"
                   value={this.state.address}
                   onChange={this.handleInputChange}/>
          </p>
        </div>
        <div className="field">
          <label className="label">Email</label>
          <p className="control">
            <input className="input"
                   type="text"
                   placeholder="Email"
                   name="email"
                   value={this.state.email}
                   onChange={this.handleInputChange}/>
          </p>
        </div>
        <div className="field">
          <p className="control">
            <button className="button is-primary"
                    type="submit">
                    {/* disabled={this.valid}> */}
              Skapa Kund
            </button>
          </p>
        </div>
      </form>
    );
  }
}

export default CustomerForm;
