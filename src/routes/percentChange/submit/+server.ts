import { db } from '$lib/database';
import { json } from '@sveltejs/kit';

export async function POST({ request }) {
  const { id, date1, date2 } = await request.json();
  const query = `SELECT ((md2.StockPrice - md1.StockPrice) / md1.StockPrice) * 100 AS PercentageChange FROM MarketData md1 INNER JOIN MarketData md2 ON md1.StockID = md2.StockID AND md2.DateOfMeasurement = '${date2}' WHERE md1.DateOfMeasurement = '${date1}' AND md1.StockID = ${id};`;
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
