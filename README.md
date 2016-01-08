## Dolores Landingham Bot

[![Build Status](https://travis-ci.org/18F/dolores-landingham-bot.svg?branch=master)](https://travis-ci.org/18F/dolores-landingham-bot)

![Dolores](http://seattletimes.nwsource.com/ABPub/2006/05/11/2002987603.jpg)

This is a Slack bot that helps onboard new hires at Cantina through scheduled Slack
messages about topics relevant to our employees. Mrs. Landingham will walk you through how we work, 
where you can find information, and other general information that is important to new hires.

Please file an issue if you have any questions about Mrs. Landingham.

Mrs. Landingham is a forked bot, created by the fine folks at [18F](https://github.com/18F/dolores-landingham-bot)

### Usage Instructions

**To add new users**

1. Go to https://cantina-onboarding-bot.herokuapp.com/
2. Login in with your Cantina account
2. Click [Add an employee](https://cantina-onboarding-bot.herokuapp.com/employees/new)
3. Write their Slack username without the @ symbol
4. Select the date that they started
5. Select the time zone that they reside in
6. Click [See all employees](https://cantina-onboarding-bot.herokuapp.com/employees) to make sure they’re on the list

**To add new messages**

1. Draft the message in a Google Doc
2. Copy the message and paste it in the message body at [create scheduled message](https://cantina-onboarding-bot.herokuapp.com/scheduled_messages/new)
3. Add a title to your message to be able to identify the message
4. Add the number of days *after* an employee starts.
5. Select a time that the message should be sent (the message will be sent at each employee's local time)
6. Add tags to be able to surface the message

### Using Dolores

Employees can view the scheduled messages that Dolores sends employees by visiting
https://cantina-onboarding-bot.herokuapp.com/.

Any Cantina employee with a Slack handle can add themselves as a Dolores Landingham
message recipient [here](https://cantina-onboarding-bot.herokuapp.com/). You'll have to set your start day as today though.

Only admin users can add and update scheduled messages. If you would like to
add or update scheduled messages, please DM Hondo on Slack 

Admin users can add scheduled messages
[here](https://cantina-onboarding-bot.herokuapp.com/scheduled_messages/new).

Scheduled messages include a "day count" attribute. Messages to be sent on the
day an employee starts have a day count of 0, messages to be sent the next day
should have a day count of 1, and so on.

### Public domain

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

For more information, see [license](LICENSE.md).
