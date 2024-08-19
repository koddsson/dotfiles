import { platform } from 'node:os';

switch (platform()) {
	case 'darwin':
		import('./macos.mjs');
		break;
	default:
		console.error(`Platform ${platform()} is not supported.. yet!`);
		break;
}
