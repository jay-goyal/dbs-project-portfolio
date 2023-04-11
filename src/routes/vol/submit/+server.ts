import { db } from '$lib/database';
import { json } from '@sveltejs/kit';

export async function POST({ request }) {
  const { id } = await request.json();
  const query = `SELECT SQRT(POWER((TotalReturn - AnnualizedReturn), 2)) AS VOLATILITY FROM Investment WHERE InvestmentID = ${id};`;
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
