module handlers

import ext {Bot, Updates, ResponseCallbackQuery}

pub struct CallbackQueryHandler {
	response ResponseCallbackQuery
}

pub fn new_callback_query_handler(r ResponseCallbackQuery) CallbackQueryHandler {
	return CallbackQueryHandler {
		response: r
	}
}

pub fn (ncq CallbackQueryHandler) check_update(update Updates) bool {
	if update.callback_query.id != "" {
		return true
	}
	return false
}

pub fn (ncq CallbackQueryHandler) handle_update(b Bot, update Updates) {
	ncq.response(b, update.callback_query)
}

pub fn (ncq CallbackQueryHandler) name() string {
	return "NEW_CALLBACK_QUERY_HANDLER"
}
