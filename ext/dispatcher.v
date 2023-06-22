module ext

pub struct Dispatcher {
pub:
	limiter chan int
pub mut:
	handler []Handler
}

pub fn new_dispatcher(max_coroutine int) Dispatcher {
	limiter := chan int{cap: max_coroutine}
	return Dispatcher {
		limiter: limiter
		handler: []
	}
}

pub fn (mut d Dispatcher) add_handler(handler Handler) {
	d.handler << handler
}

pub fn (d Dispatcher) start(b Bot, update_channel chan Updates) {
	for {
		update := <-update_channel {
			d.limiter <- 0
			go fn (update Updates, limiter chan int, handlers []Handler, b Bot) {
				defer {
					<-limiter
				}
				for handler in handlers {
					if handler.check_update(update) {
						handler.handle_update(b, update)
					}
				}
			}(update, d.limiter, d.handler, b)
		}

	}
}

