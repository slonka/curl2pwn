var heroin = require('heroin-js');

var configurator = heroin(process.env.HEROKU_API_TOKEN);

var base = {
  name: 'curl2pwn',
  region: 'eu',
  maintenance: false,
  stack: 'cedar-14',
  addons: {
    librato: {
      plan: 'librato:development'
    },
    logentries: {
      plan: 'logentries:le_tryit'
    },
    papertrail: {
      plan: 'papertrail:choklad'
    }
  },
  config_vars: {
    NODE_ENV: 'production',
    HOST: 'https://curl2pwn.herokuapp.com'
  },
  collaborators: ['krzysztof.slonka@schibsted.pl', 'krzysztofslonka@gmail.com'],
  domains: ['curl2pwn.pl', 'www.curl2pwn.pl', 'curl2pwn.herokuapp.com']
};

configurator(base);
