module main

import user

struct Company {
mut:
	emploee &user.User
}

fn main() {
	mut user1_ref := user.create_user_ref('Anton', 22) or { panic(err) }
	println(user1_ref)
	user1_ref.name = 'Sasuke'
	println(user1_ref)
}
