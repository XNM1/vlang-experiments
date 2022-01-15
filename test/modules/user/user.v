module user

struct User {
pub mut:
	name string
	age Age
}

pub fn create_user(name string, age int) ?User {
	return User{ name, create_age(age) ? }
}

pub fn create_user_ref(name string, age int) ?&User {
	u := create_user(name, age) ?
	return &u
}