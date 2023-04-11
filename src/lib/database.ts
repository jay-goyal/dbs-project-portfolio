import mysql from 'mysql2';

export const db = mysql.createConnection({
  host: '172.18.0.2',
  user: 'root',
  password: '2811',
  database: 'Portfolio'
});

export function isConnected(): boolean {
  let status = true;
  db.connect(function (err) {
    if (err) {
      status = false;
    }
  });
  return status;
}
