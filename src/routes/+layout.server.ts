import { isConnected } from '$lib/database';
import type { PageServerLoad } from './$types';

export const load = (() => {
  return { dbConnected: isConnected() };
}) satisfies PageServerLoad;
