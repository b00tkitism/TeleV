module ext

import json
import net.http

pub fn (b Bot) send_api_request(method string, _data string) string {
	result := http.post_json("${b.endpoint}${b.bot_token}/${method}", _data) or { return "" }
	if result.status_code == 200 {
		jsresp := json.decode(ResponseOk, result.body) or { return "" }
		return jsresp.result
	} else {
		return ""
	}
}

[params]
pub struct GetUpdatesParameters {
	offset i64
	limit int
	timeout int
	allowed_updates []string = ["message", "callback_query"]
}
pub fn (b Bot) get_updates(params GetUpdatesParameters) []Updates {
	resp := json.decode([]Updates, b.send_api_request("getUpdates", json.encode(params))) or { return []Updates{} }
	return resp
}

pub fn (b Bot) get_me() User {
	resp := json.decode(User, b,send_api_request("getMe")) or { return User{} }
	return resp
}

[params]
pub struct SendMessageParams {
	chat_id i64
	message_thread_id i64
	text string
	parse_mode string
	entities []MessageEntity
	disable_web_page_preview bool
	disable_notification bool
	protect_content bool
	reply_to_message_id i64
	allow_sending_without_reply bool
	reply_markup InlineKeyboardMarkup
}
pub fn (b Bot) send_message(params SendMessageParams) Message {
	resp := json.decode(Message, b.send_api_request("sendMessage", json.encode(params))) or { return Message{} }
	return resp
}

[params]
pub struct ReplyMessageParams {
	bot Bot
	message_thread_id i64
	text string
	parse_mode string
	entities []MessageEntity
	disable_web_page_preview bool
	disable_notification bool
	protect_content bool
	allow_sending_without_reply bool
	reply_markup InlineKeyboardMarkup
}
pub fn (m Message) reply(params ReplyMessageParams) Message {
	send_message_parameters := SendMessageParams {
		chat_id: m.chat.id
		message_thread_id: params.message_thread_id
		text: params.text
		parse_mode: params.parse_mode
		entities: params.entities
		disable_web_page_preview: params.disable_web_page_preview
		disable_notification: params.protect_content
		protect_content: params.protect_content
		reply_to_message_id: m.message_id
		allow_sending_without_reply: params.allow_sending_without_reply
		reply_markup: params.reply_markup
	}
	resp := params.bot.send_message(send_message_parameters)
	return resp
}

[params]
pub struct AnswerCallbackQueryParams {
	callback_query_id string
	text string
	show_alert bool
	url string
	cache_time i64
}
pub fn (b Bot) answer_callback_query(params AnswerCallbackQueryParams) bool {
	resp := b.send_api_request("answerCallbackQuery", json.encode(params))
	println(resp)
	return if resp == "true" { true } else { false }
}

[params]
pub struct XAnswerCallbackQueryParams {
	bot Bot
	text string
	show_alert bool
	url string
	cache_time i64
}
pub fn (c CallbackQuery) answer(params XAnswerCallbackQueryParams) bool {
        answer_callback_query_parameters := AnswerCallbackQueryParams {
                callback_query_id: c.id
                text: params.text
		show_alert: params.show_alert
		url: params.url
		cache_time: params.cache_time
        }
        resp := params.bot.answer_callback_query(answer_callback_query_parameters)
        return resp
}
