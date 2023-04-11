import { db } from '$lib/database';
import type { PageServerLoad } from './$types';

export const load = (async () => {
  const query = `SELECT TypeOfInvestment, SUM(NumberOfShares) AS TotalShares FROM Investment GROUP BY TypeOfInvestment;`;
  const result = await new Promise((resolve, reject) => {
    db.query(query, function (err, results, fields) {
      return resolve(results);
    });
  });
  return { result };
}) satisfies PageServerLoad;
