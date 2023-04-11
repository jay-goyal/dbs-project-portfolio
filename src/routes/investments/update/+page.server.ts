import { db } from '$lib/database';
import type { Actions } from './$types';

export const actions = {
  update: async ({ request }) => {
    const data = await request.formData();
    const query = `UPDATE Investment SET NumberOfShares = ${data.get(
      'numShares'
    )} WHERE InvestmentID = ${data.get('investmentID')};`;
    console.log(query);
    db.query(query, function (err, results, fields) {
      console.log(err, results, fields);
    });
  }
} satisfies Actions;
