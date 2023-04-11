import { db } from '$lib/database';
import type { PageServerLoad } from './$types';

export const load = (async () => {
  const result = await new Promise((resolve, reject) => {
    db.query('SELECT * FROM Investment', function (err, results, fields) {
      return resolve(results);
    });
  });
  return {
    obj: result
  };
}) satisfies PageServerLoad;
