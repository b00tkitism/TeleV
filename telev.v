module telev

import globals
import ext {Bot}

[params]
pub struct NewBotParameters {
	bot_token string [required]
	endpoint string = globals.telegram_api
}

pub fn new_telegram_bot(params NewBotParameters) Bot {
	return Bot {
		bot_token: params.bot_token
		endpoint: params.endpoint
	}
}

