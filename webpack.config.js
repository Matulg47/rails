// webpack.config.js
const path = require('path');

module.exports = {
  entry: './path/to/app.js',

  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist'), // Ruta de salida del archivo bundle
  },
};
