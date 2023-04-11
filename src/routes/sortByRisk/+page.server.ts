import { db } from '$lib/database';
import type { PageServerLoad } from './$types';

export const load = (async () => {
  const query = `SELECT InvestmentID, InvestorID, StockID, AnnualizedReturn FROM Investment WHERE RiskLevel <= 0.5 ORDER BY AnnualizedReturn LIMIT 5;`;
  const result = await new Promise((resolve, reject) => {
    db.query(query, function (err, results, fields) {
      return resolve(results);
    });
  });
  return { result };
}) satisfies PageServerLoad;
