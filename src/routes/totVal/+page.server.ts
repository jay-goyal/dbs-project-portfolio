import { db } from '$lib/database';
import type { PageServerLoad } from './$types';

export const load = (async () => {
  const query = `SELECT i.InvestmentID, i.NumberOfShares, m.StockPrice, i.NumberOfShares * m.StockPrice AS TotalValue FROM Investment i INNER JOIN MarketData m ON i.StockID = m.StockID and m.DateOfMeasurement = CURDATE();`;
  const result = await new Promise((resolve, reject) => {
    db.query(query, function (err, results, fields) {
      return resolve(results);
    });
  });
  return { result };
}) satisfies PageServerLoad;
