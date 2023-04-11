import { db } from '$lib/database';
import { json } from '@sveltejs/kit';

export async function POST({ request }) {
  const { id } = await request.json();
  const query = `SELECT m.DateOfMeasurement, m.StockPrice FROM Investment i INNER JOIN MarketData m ON i.StockID = m.StockID WHERE i.InvestmentID = ${id} AND m.DateOfMeasurement BETWEEN i.DateOfInvestment AND i.DateOfMeasurement;`;
  console.log(query);

  const result = await new Promise((resolve, reject) => {
    db.query(query, function (err, results, fields) {
      console.log(err);
      return resolve(results);
    });
  });
  console.log(result);
  return json({ result }, { status: 200 });
}
