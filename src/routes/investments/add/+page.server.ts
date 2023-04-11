import { db } from '$lib/database';
import type { Actions } from './$types';

export const actions = {
  add: async ({ request }) => {
    const data = await request.formData();
    const query = `INSERT INTO Investment (InvestorID, StockID, DateOfInvestment, NumberOfShares, TypeOfInvestment) VALUES (${data.get(
      'investorID'
    )}, ${data.get('stockID')}, '${data.get('doi')}', ${data.get('nos')}, '${data.get('toi')}');`;
    db.query(query, function (err, results, fields) {
      console.log(err, results, fields);
    });
  }
} satisfies Actions;
