import { WebSocketServer } from 'ws';
import url from 'url';
// const url = require('url');



const wss = new WebSocketServer({ port: 8080 });

const clients = {};
// const ws_clients = {};

wss.on('connection', function connection(ws, req) {
  // console.log( req.headers['sec-websocket-key']);
  clients[url.parse(req.url, true).query.from] = ws
  
  console.log(url.parse(req.url, true).query.from);
  console.log(url.parse(req.url, true).query.to);
  
  
  ws.on('message', (message) => {
    console.log(`Получено сообщение: ${message}`)
    // console.log(clients);
    clients[url.parse(req.url, true).query.to].send(String(message));
    
  });
  

  ws.on('close', () => {
    console.log('close');
    
    // clients.splice(clients.indexOf(ws), 1); // Убираем клиента из списка при отключении
  });
});