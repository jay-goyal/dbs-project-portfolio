import { db } from '$lib/database';
import { json } from '@sveltejs/kit';

export async function POST({ request }) {
  const { date } = await request.json();
  console.log(date);
  const query = `SELECT i.InvestmentID, i.StockID, m.DateOfMeasurement, m.StockPrice FROM Investment i INNER JOIN MarketData m ON i.StockID = m.StockID WHERE m.DateOfMeasurement = '${date}';`;
  console.log(query);

  const result = await new Promise((resolve, reject) => {
    db.query(query, function (err, results, fields) {
      console.log(results);
      return resolve(results);
    });
  });
  console.log(result);
  return json({ result }, { status: 200 });
}
