const port = 3010;
const app = require('./App/config/server');

app.listen(port,() => {
  console.log(`O servidor subiu na porta ${port}`);
});


