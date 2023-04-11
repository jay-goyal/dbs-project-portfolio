import { db } from '$lib/database';
import type { PageServerLoad } from './$types';

export const load = (async () => {
  const query = `SELECT i.InvestmentID, s.NameOfStock, i.NumberOfShares, i.AnnualizedReturn, i.RiskLevel FROM Investment i INNER JOIN Stock s ON i.StockID = s.StockID ORDER BY i.AnnualizedReturn DESC, i.RiskLevel ASC LIMIT 5;`;
  const result = await new Promise((resolve, reject) => {
    db.query(query, function (err, results, fields) {
      return resolve(results);
    });
  });
  return { result };
}) satisfies PageServerLoad;
