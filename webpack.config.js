// webpack.config.js
const path = require('path');

module.exports = {
  entry: './src/index.js', // Ruta al punto de entrada de tu aplicación
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist'), // Ruta de salida del archivo bundle
  },
};
