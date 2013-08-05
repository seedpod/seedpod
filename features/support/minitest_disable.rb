# Fix for cucumber throwing a minitest argument error
# From https://github.com/cucumber/multi_test/pull/2#issuecomment-21863459

require 'multi_test'
MultiTest.disable_autorun