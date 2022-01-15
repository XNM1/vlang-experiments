module user

struct Age {
mut:
	value u8
}

fn (mut a Age) set(b int) ? {
	if 0 < b && b < 120 { a.value = b }
	else { return error('incorrect age') }
}

pub fn (a Age) get() int {
	return a.value
}

pub fn create_age(age int) ?Age {
	mut a := Age{}
	a.set(age) ?
	return a
}

pub fn create_age_ref(age int) ?&Age {
	mut a := create_age(age) ?
	return &a
}