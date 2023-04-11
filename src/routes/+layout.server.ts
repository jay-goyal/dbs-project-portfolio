import { isConnected } from '$lib/database';
import type { LayoutServerLoad } from './$types';

export const load = (() => {
  return { dbConnected: isConnected() };
}) satisfies LayoutServerLoad;
