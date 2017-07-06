import WebpackerReact from 'webpacker-react';
import Customers from 'components/customers';
import Customer from 'components/customer';
import CustomerForm from 'components/customer_form';
import CustomersTable from 'components/customers_table';

WebpackerReact.setup({ Customer });
WebpackerReact.setup({ CustomerForm });
WebpackerReact.setup({ Customers });
