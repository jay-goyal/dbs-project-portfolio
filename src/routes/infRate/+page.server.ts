import { db } from '$lib/database';
import type { PageServerLoad } from './$types';

export const load = (async () => {
  const query = `SELECT Date, InflationRate FROM OtherFinancialInfo ORDER BY Date DESC LIMIT 1;
`;
  const result = await new Promise((resolve, reject) => {
    db.query(query, function (err, results, fields) {
      return resolve(results);
    });
  });
  return { result };
}) satisfies PageServerLoad;
