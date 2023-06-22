module ext

import globals

pub type ResponseMessage = fn (Bot, Message)
pub type ResponseCallbackQuery = fn (Bot, CallbackQuery)

pub struct Bot {
pub:
	bot_token string
	endpoint string = globals.telegram_api
}

pub struct ResponseOk {
pub:
	ok bool
	result string [raw]
}

pub struct ResponseNotOk {
pub:
        ok bool
        error_code int
	description string
}

pub struct Updates {
pub:
	update_id i64
	message Message
	edited_message Message
	channel_post Message
	edited_channel_post Message
	inline_query InlineQuery
	chosen_inline_result ChosenInlineResult
	callback_query CallbackQuery
	shipping_query ShippingQuery
	pre_checkout_query PreCheckoutQuery
	poll Poll
	poll_answer PollAnswer
	my_chat_member ChatMemberUpdated
	chat_member ChatMemberUpdated
	chat_join_request ChatJoinRequest
}

pub struct User {
pub:
	id i64
	is_bot bool
	first_name string
	last_name string
	username string
	language_code string
	is_premium bool = true
	added_to_attachement_menu bool = true
	can_join_groups bool
	can_read_all_group_messages bool
	support_inline_queries bool
}

pub struct Chat {
pub:
	id i64
	@type string
	title string
	username string
	first_name string
	last_name string
	is_forum bool = true
	photo ChatPhoto
	active_usernames []string
	emoji_status_custom_emoji_id string
	bio string
	has_private_forwards bool = true
	has_restricted_voice_and_video_messages bool = true
	join_to_send_messages bool = true
	join_by_request bool = true
	description string
	invite_link string
	pinned_message &Message = unsafe { nil }
	permissions ChatPermissions
	slow_mode_delay int
	message_auto_delete_time int
	has_aggressive_anti_spam_enabled bool = true
	has_hidden_members bool = true
	has_protected_content bool = true
	sticker_set_name string
	can_set_sticker_set bool = true
	linked_chat_id i64
	location ChatLocation
}

pub struct Message {
pub:
	message_id i64
	message_thread_id i64
	from User
	sender_chat Chat
	date int
	chat Chat
	forward_from User
	forward_from_chat Chat
	forward_from_message_id i64
	forward_signature string
	forward_sender_name string
	forward_date int
	is_topic_message bool = true
	is_automatic_forward bool = true
	reply_to_message &Message = unsafe { nil }
	via_bot User
	edit_date int
	has_protected_content bool = true
	media_group_id string
	author_signature string
	text string
	entities []MessageEntity
	animation Animation
	audio Audio
	document Document
	photo []PhotoSize
	sticker Sticker
	video Video
	video_note VideoNote
	voice Voice
	caption string
	caption_entities []MessageEntity
	has_media_spoiler bool = true
	contact Contact
	dice Dice
	game Game
	poll Poll
	venue Venue
	location Location
	new_chat_members []User
	left_chat_member User
	new_chat_title string
	new_chat_photo []PhotoSize
	delete_chat_photo bool = true
	group_chat_created bool = true
	supergroup_chat_created bool = true
	channel_chat_created bool = true
	message_auto_delete_timer_changed MessageAutoDeleteTimerChanged
	migrate_to_chat_id i64
	migrate_from_chat_id i64
	pinned_message &Message = unsafe { nil }
	invoice Invoice
	successful_payment SuccessfulPayment
	user_shared UserShared
	chat_shared ChatShared
	connected_website string
	write_access_allowed WriteAccessAllowed
	passport_data PassportData
	proximity_alert_triggered ProximityAlertTriggered
	forum_topic_created ForumTopicCreated
	forum_topic_edited ForumTopicEdited
	forum_topic_closed ForumTopicClosed
	forum_topic_reopened ForumTopicReopened
	general_forum_topic_hidden GeneralForumTopicHidden
	general_forum_topic_unhidden GeneralForumTopicUnhidden
	video_chat_scheduled VideoChatScheduled
	video_chat_started VideoChatStarted
	video_chat_ended VideoChatEnded
	video_chat_participants_invited VideoChatParticipantsInvited
	web_app_data WebAppData
	reply_markup InlineKeyboardMarkup
}

pub struct MessageId {
pub:
	message_id i64
}

pub struct MessageEntity {
pub:
	@type string
	offset int
	length int
	url string
	user User
	language string
	custom_emoji_id string
}

pub struct PhotoSize {
pub:
	file_id string
	file_unique_id string
	width int
	height int
	file_size int
}

pub struct Animation {
pub:
	file_id string
	file_unique_id string
	width int
	height int
	duration int
	thumbnail PhotoSize
	file_name string
	mime_type string
	file_size int
}

pub struct Audio {
pub:
	file_id string
	file_unique_id string
	duration int
	performer string
	title string
	file_name string
	mime_type string
	file_size int
	thumbnail PhotoSize
}

pub struct Document {
pub:
	file_id string
	file_unique_id string
	thumbnail PhotoSize
	file_name string
	mime_type string
	file_size int
}

pub struct Video {
pub:
	file_id string
	file_unique_id string
	width int
	height int
	duration int
	thumbnail PhotoSize
	file_name string
	mime_type string
	file_size int
}

pub struct VideoNote {
pub:
	file_id string
	file_unique_id string
	length int
	duration int
	thumbnail PhotoSize
	file_size int
}

pub struct Voice {
pub:
	file_id string
	file_unique_id string
	duration int
	mime_type string
	file_size int
}

pub struct Contact {
pub:
	phone_number string
	first_name string
	last_name string
	user_id i64
	vcard string
}

pub struct Dice {
pub:
	emoji string
	value int
}

pub struct PollOption {
pub:
	text string
	voter_count int
}

pub struct PollAnswer {
pub:
	poll_id string
	user User
	option_ids []int
}

pub struct Poll {
pub:
	id string
	question string
	options []PollOption
	total_voter_count int
	is_closed bool
	is_anonymous bool
	@type string
	allows_multiple_answers bool
	correct_option_id i64
	explanation string
	explanation_entities []MessageEntity
	open_period int
	close_date int
}

pub struct Location {
pub:
	longitude f64
	latiude f64
	horizontal_accuracy f64
	live_period int
	heading int
	proximity_alert_radius int
}

pub struct Venue {
pub:
	location Location
	title string
	address string
	foursquare_id string
	foursquare_type string
	google_place_id string
	google_place_type string
}

pub struct WebAppData {
pub:
	data string
	button_text string
}

pub struct ProximityAlertTriggered {
pub:
	traveler User
	watcher User
	distance int
}

pub struct ForumTopicCreated {
pub:
	name string
	icon_color int
	icon_custom_emoji_id string
}

pub struct ForumTopicClosed {
}

pub struct ForumTopicEdited {
pub:
	name string
	icon_custom_emoji_id string
}

pub struct ForumTopicReopened {
}

pub struct GeneralForumTopicHidden {
}

pub struct GeneralForumTopicUnhidden {
}

pub struct UserShared {
pub:
	request_id i64
	user_id i64
}

pub struct ChatShared {
pub:
	request_id i64
	chat_id i64
}

pub struct WriteAccessAllowed {
pub:
	web_app_name string
}

pub struct VideoChatScheduled {
pub:
	start_date int
}

pub struct VideoChatStarted {
}

pub struct VideoChatEnded {
pub:
	duration int
}

pub struct VideoChatParticipantsInvited {
pub:
	users []User
}

pub struct UserProfilePhotos {
pub:
	total_count i64
	photos [][]PhotoSize
}

pub struct File {
pub:
	file_id string
	file_unique_id string
	file_size int
	file_path string
}

pub struct WebAppInfo {
pub:
	url string
}

pub struct ReplyKeyboardMarkup {
pub:
	keyboard [][]KeyboardButton
	is_persistent bool
	resize_keyboard bool
	one_time_keyboard bool
	input_field_placeholder string
	selective bool
}

pub struct KeyboardButton {
pub:
	text string
	request_user KeyboardButtonRequestUser
	request_chat KeyboardButtonRequestChat
	request_contact bool
	request_location bool
	request_poll KeyboardButtonPollType
	web_app WebAppInfo
}

pub struct KeyboardButtonRequestUser {
pub:
	request_id i64
	user_is_bot bool
	user_is_premium bool
}

pub struct KeyboardButtonRequestChat {
pub:
	request_id i64
	chat_is_channel bool
	chat_is_forum bool
	chat_has_username bool
	chat_is_created bool
	user_administrator_rights ChatAdministratorRights
	bot_administrator_rights ChatAdministratorRights
	bot_is_member bool
}

pub struct KeyboardButtonPollType {
pub:
	@type string
}

pub struct ReplyKeyboardRemove {
pub:
	remove_keyboard bool = true
	selective bool
}

pub struct InlineKeyboardMarkup {
pub:
	inline_keyboard [][]InlineKeyboardButton
}

pub struct InlineKeyboardButton {
pub:
	text string
	url string
	callback_data string
	web_app WebAppInfo
	login_url LoginUrl
	switch_inline_query string
	switch_inline_query_current_chat string
	switch_inline_query_chosen_chat SwitchInlineQueryChosenChat
	callback_game CallbackGame
	pay bool
}

pub struct LoginUrl {
pub:
	url string
	forward_text string
	bot_username string
	request_write_access bool
}

pub struct SwitchInlineQueryChosenChat {
pub:
	query string
	allow_user_chats bool
	allow_bot_chats bool
	allow_group_chats bool
	allow_channel_chats bool
}

pub struct CallbackQuery {
pub:
	id string
	from User
	message Message
	inline_message_id string
	chat_instance string
	data string
	game_short_name string
}

pub struct ForceReply {
pub:
	force_reply bool = true
	input_field_placeholder string
	selective bool
}

pub struct ChatPhoto {
pub:
	small_file_id string
	small_file_unique_id string
	big_file_id string
	big_file_unique_id string
}

pub struct ChatInviteLink {
pub:
	invite_link string
	creator User
	creates_join_request bool
	is_primary bool
	is_revoked bool
	name string
	expire_date int
	member_limit int
	pending_join_request_count int
}

pub struct ChatAdministratorRights {
pub:
	is_anonymous bool
	can_manage_chat bool
	can_delete_messages bool
	can_manage_video_chats bool
	can_restrict_members bool
	can_promote_members bool
	can_change_info bool
	can_invite_users bool
	can_post_messages bool
	can_edit_messages bool
	can_pin_messages bool
	can_manage_topics bool
}

pub type ChatMember = ChatMemberOwner | ChatMemberAdministrator | ChatMemberMember | ChatMemberRestricted | ChatMemberLeft | ChatMemberBanned

pub struct ChatMemberOwner  {
pub:
	status string
	user User
	is_anonymous bool
	custom_title string
}

pub struct ChatMemberAdministrator {
pub:
	status string
	user User
	can_be_edited bool
	is_anonymous bool
	can_manage_chat bool
	can_delete_messages bool
	can_manage_video_chats bool
	can_restrict_members bool
	can_promote_members bool
	can_change_info bool
	can_invite_users bool
	can_post_messages bool
	can_edit_messages bool
	can_pin_messages bool
	can_manage_topics bool
	custom_title string
}

pub struct ChatMemberMember {
pub:
	status string
	user User
}

pub struct ChatMemberRestricted {
pub:
	statu string
	user User
	is_member bool
	can_send_messages bool
	can_send_audios bool
	can_send_documents bool
	can_send_photos bool
	can_send_videos bool
	can_send_video_notes bool
	can_send_voice_notes bool
	can_send_polls bool
	can_send_other_messages bool
	can_add_web_page_previews bool
	can_change_info bool
	can_invite_users bool
	can_pin_messages bool
	can_manage_topics bool
	until_date int
}

pub struct ChatMemberLeft {
pub:
	status string
	user User
}

pub struct ChatMemberBanned {
pub:
	status string
	user User
	until_date int
}

pub struct ChatMemberUpdated {
pub:
	chat Chat
	from User
	date int
	old_chat_member ChatMember
	new_chat_member ChatMember
	invite_link ChatInviteLink
	via_chat_folder_invite_link bool
}

pub struct ChatJoinRequest {
pub:
	chat Chat
	from User
	user_chat_id i64
	date int
	bio string
	invite_link ChatInviteLink
}

pub struct ChatPermissions {
pub:
	can_send_messages bool
	can_send_audios bool
	can_send_documents bool
	can_send_photos bool
	can_send_videos bool
	can_send_video_notes bool
	can_send_voice_notes bool
	can_send_polls bool
	can_send_other_messages bool
	can_add_web_page_previews bool
	can_change_info bool
	can_invite_users bool
	can_pin_messages bool
	can_manage_topics bool
}

pub struct ChatLocation {
pub:
	location Location
	address string
}

pub struct ForumTopic {
pub:
	message_thread_id i64
	name string
	icon_color i64
	icon_custom_emoji_id string
}

pub struct BotCommand {
pub:
	command string
	description string
}

pub type BotCommandScope = BotCommandScopeDefault | BotCommandScopeAllPrivateChats | BotCommandScopeAllGroupChats | BotCommandScopeAllChatAdministrators | BotCommandScopeChat | BotCommandScopeChatAdministrators | BotCommandScopeChatMember

pub struct BotCommandScopeDefault {
pub:
	@type string
}

pub struct BotCommandScopeAllPrivateChats {
pub:
	@type string
}

pub struct BotCommandScopeAllGroupChats {
pub:
	@type string
}

pub struct BotCommandScopeAllChatAdministrators {
pub:
	@type string
}

pub struct BotCommandScopeChat {
pub:
	@type string
	chat_id i64
}

pub struct BotCommandScopeChatAdministrators {
pub:
	@type string
	chat_id i64
}

pub struct BotCommandScopeChatMember {
pub:
	@type string
	chat_id i64
	user_id i64
}

pub struct BotName {
pub:
	name string
}

pub struct BotDescription {
pub:
	description string
}

pub struct BotShortDescription {
pub:
	short_description string
}

pub type MenuButton = MenuButtonCommands | MenuButtonWebApp | MenuButtonDefault

pub struct MenuButtonCommands {
pub:
	@type string
}

pub struct MenuButtonWebApp {
pub:
	@type string
	text string
	web_app WebAppInfo
}

pub struct MenuButtonDefault {
pub:
	@type string
}

pub struct ResponseParameters {
pub:
	migrate_to_chat_id i64
	retry_after i64
}

pub type InputMedia = InputMediaAnimation | InputMediaDocument | InputMediaAudio | InputMediaPhoto | InputMediaVideo

pub struct InputMediaPhoto {
pub:
	@type string
	media string
	caption string
	parse_mode string
	caption_entities []MessageEntity
	has_spoiler bool
}

pub type FileString = InputFile | string

pub struct InputMediaVideo {
pub:
	@type string
	media string
	thumbnail FileString
	caption string
	parse_mode string
	caption_entities []MessageEntity
	width i64
	height i64
	duration i64
	support_streaming bool
	has_spoiler bool
}

pub struct InputMediaAnimation {
pub:
	@type string
	media string
	thumbnail FileString
	caption string
	parse_mode string
	caption_entities []MessageEntity
	width i64
	height i64
	duration i64
	support_streaming bool
	has_spoiler bool
}

pub struct InputMediaAudio {
pub:
	@type string
	media string
	thumbnail FileString
	caption string
	parse_mode string
	caption_entities []MessageEntity
	duration i64
	performer string
	title string
}

pub struct InputMediaDocument {
pub:
	@type string
	media string
	thumbnail FileString
	caption string
	parse_mode string
	caption_entities []MessageEntity
	disable_content_type_detection bool
}

pub struct MessageAutoDeleteTimerChanged {
pub:
	message_auto_delete_time int
}

pub struct Invoice {
pub:
	title string
	description string
	start_parameter string
	currency string
	total_amount string
}

pub struct SuccessfulPayment {
pub:
	currency string
	total_amount int
	invoice_payload string
	shipping_option_id string
	order_info OrderInfo
	telegram_payment_charge_id string
	provider_payment_charge_id string
}

pub struct OrderInfo {
pub:
	name string
	phone_number string
	email string
	shipping_address ShippingAddress
}

pub struct ShippingAddress {
pub:
	country_code string
	state string
	city string
	street_line1 string
	street_line2 string
	post_code string
}

pub struct PassportData {
pub:
	data []EncryptedPassportElement
	credentials EncryptedCredentials
}

pub struct EncryptedPassportElement {
pub:
	@type string
	date string
	phone_number string
	email string
	files []PassportFile
	front_side PassportFile
	reverse_side PassportFile
	selfie PassportFile
	translation []PassportFile
	hash string
}

pub struct PassportFile {
pub:
	file_id string
	file_unique_id string
	file_size int
	file_date int
}

pub struct EncryptedCredentials {
pub:
	data string
	hash string
	secret string
}

pub struct CallbackGame {
}

pub struct InlineQuery {
	id string
	from User
	query string
	offset string
	chat_type string
	location Location
}

pub struct ChosenInlineResult {
pub:
	result_id string
	from User
	location Location
	inline_message_id string
	query string
}

pub struct ShippingQuery {
pub:
	id string
	from User
	invoice_payload string
	shipping_address ShippingAddress
}

pub struct PreCheckoutQuery {
pub:
	id string
	from User
	currency string
	total_amount i64
	invoice_payload string
	shipping_option_id string
	order_info OrderInfo
}

pub struct Sticker {
pub:
	file_id string
	file_unique_id string
	@type string
	width int
	height int
	is_animated bool
	is_video bool
	thumbnail PhotoSize
	emoji string
	set_name string
	premium_animation File
	mark_position MarkPosition
	custom_emoji_id string
	needs_repainting bool = true
	file_size int
}

pub struct MarkPosition {
pub:
	point string
	x_shift f64
	y_shift f64
	scale f64
}

pub struct Game {
pub:
	title string
	description string
	photo []PhotoSize
	text string
	text_entities []MessageEntity
	animation Animation
}
