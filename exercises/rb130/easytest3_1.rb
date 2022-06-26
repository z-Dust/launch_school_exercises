assert value.odd?, 'value is not odd'

assert_equal 'xyz', value.downcase

assert_equal nil, value
assert_nli value

assert list.empty?, 'list is not empty'
assert_empty list
assert_equal true, list.empty?

assert_equal true, list.include?('xyz')
assert list.include?('xyz')
assert_includes list, 'xyz'

assert_raises NoExperienceError do
  employee.hire
end

assert_instance_of Numeric, value

assert_kind_of Numeric, value

assert_same list, list.process

refute_includes list, 'xyz'
