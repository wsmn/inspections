import WebpackerReact from 'webpacker-react';
import Turbolinks from 'turbolinks';
import Dropbox from '../components/dropbox/dropbox';

Turbolinks.start()
WebpackerReact.setup({ Dropbox });
