module ext

pub interface Handler {
	check_update(update Updates) bool
	handle_update(b Bot, update Updates)
	name() string
}

