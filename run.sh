#!/usr/bin/env bash

bundle install
bundle exec mutant --include lib --use rspec LoginController Teacher Subject Student User Email EmailInfo SubjectInfo FilesHandler ScheduleInfo Schedule
bundle exec rspec
bundle exec rubocop
bundle exec reek

