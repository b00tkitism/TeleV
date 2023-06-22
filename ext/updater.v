module ext

import time

pub struct Updater {
pub:
	dispatcher Dispatcher
	polling chan int
pub mut:
	drop_pending bool
}

pub fn new_updater(dispatcher Dispatcher, polling chan int, drop_pending bool) Updater {
	return Updater {
		dispatcher: dispatcher
		polling: polling
		drop_pending: drop_pending
	}
}

pub fn (mut u Updater) start(b Bot) {
	update_channel := chan Updates{}
	go u.dispatcher.start(b, update_channel)
	u.do_polling(b, update_channel)
}

fn (mut u Updater) do_polling(b Bot, update_channel chan Updates) {
	mut offset := i64(-1)
	for {
		select {
			_ := <-u.polling {
				return
			}
			2 * time.millisecond {}
		}
		mut updates := b.get_updates(offset: offset, limit: 100)
		if updates.len > 0 {
			if offset == i64(-1) {
				offset = updates[0].update_id
				updates = updates[1..]
			}
		}
		for update in updates {
			if offset < update.update_id {
				offset = update.update_id
				update_channel <- update
			}
		}

	}
}

pub fn (mut u Updater) stop_polling() {
	u.polling <- 0
}
