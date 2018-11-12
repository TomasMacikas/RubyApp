#!/usr/bin/env bash

bundle install
bundle exec mutant --include lib --use rspec LoginController Teacher TeacherWindow Subject SubjectWindow Student StudentWindow User Email SubjectInfo FilesHandler Schedule Exams Grades NotificationWindow Notification
bundle exec rspec
bundle exec rubocop
bundle exec reek
