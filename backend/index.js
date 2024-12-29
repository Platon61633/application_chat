import { WebSocketServer } from 'ws';
import url from 'url';
import { log } from 'console';
// const url = require('url');



const wss = new WebSocketServer({ port: 8080 });

const clients = {};
// const ws_clients = {};

wss.on('connection', function connection(ws, req) {
  // console.log( req.headers['sec-websocket-key']);
  if (url.parse(req.url, true).path=='/get_users') {
    ws.send(JSON.stringify(Object.keys(clients)))
    console.log('в чате: '+JSON.stringify(Object.keys(clients)));
    
  } else {
    clients[url.parse(req.url, true).query.from] = ws
    console.log(url.parse(req.url, true).query.from);
    console.log(url.parse(req.url, true).query.to);
  }
  
  
  ws.on('message', (message) => {
    console.log(`Получено сообщение: ${message}`)
    console.log();
    clients[url.parse(req.url, true).query.to].send(String(message));
    
  });
  

  ws.on('close', () => {
    for (const [key, value] of Object.entries(clients)) {
      if (clients[key]==ws) {
        delete clients[key];
        console.log(key+' close');
        break;
      }
    }
    
    // clients.splice(clients.indexOf(ws), 1); // Убираем клиента из списка при отключении
  });
});