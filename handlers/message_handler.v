module handlers

import ext {Bot, Updates, ResponseMessage}

pub struct MessageHandler {
	response ResponseMessage
}

pub fn new_message_handler(r ResponseMessage) MessageHandler {
	return MessageHandler {
		response: r
	}
}

pub fn (nm MessageHandler) check_update(update Updates) bool {
	if update.message.message_id > 0 {
		return true
	}
	return false
}

pub fn (nm MessageHandler) handle_update(b Bot, update Updates) {
	nm.response(b, update.message)
}

pub fn (nm MessageHandler) name() string {
	return "NEW_MESSAGE_HANDLER"
}
