struct User {
	name          string
	age           int
	is_registered bool
}

fn create_user(name string, age int) User {
	return User{
		name: name,
		age: age
	}
}

fn (u User) register() User {
	return User{
		...u
		is_registered: true
	}
}