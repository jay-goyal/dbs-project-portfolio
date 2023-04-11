import { db } from '$lib/database';
import type { Actions } from './$types';

export const actions = {
  delete: async ({ request }) => {
    const data = await request.formData();
    const query = `DELETE FROM Investment WHERE InvestmentID = ${data.get('investmentID')};`;
    db.query(query, function (error, result, fields) {
      console.log(error, result, fields);
    });
  }
} satisfies Actions;
