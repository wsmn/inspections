import Customers from 'components/customers';
import Customer from 'components/customer';
import CustomerForm from 'components/customer_form';
import WebpackerReact from 'webpacker-react';

WebpackerReact.setup({Customer});
WebpackerReact.setup({CustomerForm});
WebpackerReact.setup({Customers});
