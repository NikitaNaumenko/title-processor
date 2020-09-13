install:
	bundle install

lint:
	rubocop

lint-fix:
	rubocop -a

test:
	rake test
