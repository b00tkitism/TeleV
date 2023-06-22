# TeleV
Telegram API library for V.

Example usage:
```v
import telev
import telev.ext
import telev.handlers

pub fn handle_new_messages(b ext.Bot, message ext.Message) {
	if message.text.to_lower() == "/start" {
		keyboard := ext.InlineKeyboardMarkup{
			inline_keyboard: [
				[
					ext.InlineKeyboardButton{text: "VLang in Github", url: "https://github.com/vlang/v"}
				],
				[
					ext.InlineKeyboardButton{text: "TeleV in Github", url: "https://github.com/alom4hdi/telev"}
				]
			]
		}
		mut answer := "Hello <a href=\"tg://user?id=${message.from.id}\"><b>${message.from.first_name}</b></a>"
		answer += "\nThis is a Bot for testing TeleV (Telegram api library for <a href=\"github.com/vlang/v\">V</a>)"
		if message.chat.@type != "private" {
			answer += "\n\nI am in <b>\"${message.chat.title}\"</b> group."
		}
		message.reply(bot: b, text: answer, parse_mode: "html", reply_markup: keyboard, disable_web_page_preview: true)
	}
}

pub fn handle_new_callback_queries(b ext.Bot, callback_query ext.CallbackQuery) {
	callback_query.answer(bot: b, text: "Hello ? how did you find this ?", show_alert: false)
}

fn main() {
	max_coroutine := 100
	my_bot := telev.new_telegram_bot(bot_token: "9999999999:xxxxx-xxxxxxxxxxxxxxxxxxxxx")
	mut dispatcher := ext.new_dispatcher(max_coroutine)
	dispatcher.add_handler(handlers.new_message_handler(handle_new_messages))
	dispatcher.add_handler(handlers.new_callback_query_handler(handle_new_callback_queries))
	mut updater := ext.new_updater(dispatcher, chan int{cap: 1}, true)
	updater.start(my_bot)
}
