## Contributing

### Code of conduct

We aspire to create a welcoming environment for collaboration on this project.
To that end, we follow the [18F Code of
Conduct](https://github.com/18F/code-of-conduct/blob/master/code-of-conduct.md)
and ask that all contributors do the same.

### Not sure what to work on?

Check out the [Dolores Bot Waffle.io
board](https://waffle.io/18F/dolores-landingham-bot) and pick out something in
the "Up next" column. Make sure you move the feature you're working on the "In
progress" so we all know who is working on what.

### Git Protocol

To contribute to this project, people internal to 18F can create a branch and
submit a pull request. If you are external to 18F, you can fork the repository
and submit a pull request that way.

We are minimizing commits on the `master` branch by rebasing and squashing
commits on branches before merging them into `master`. This will require you to
force push on your branch (but not to `master`...please don't force push
`master`).

For a more detailed walk through on how to do this, you can read thoughtbot's
[Git
Protocol](https://github.com/thoughtbot/guides/tree/master/protocol/git#write-a-feature)
document.

18f-ers can merge their changes into master after getting approval from another
contributor.

### App setup

To get started, run `bin/setup`

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

The application will run locally at `http://localhost:5000/`.

If you have previously run a project on a different port, a `.foreman` file
may be generated at the root of your directory. If so, make sure that this
file is set to port `5000` or you will be unable to authenticate locally with MyUSA.

### Required Keys

The setup script creates a `.env` file with a dummy environment configuration
variables.  If you are internal to 18F and would like access to these configs,
you can contact Jessie Young. Otherwise, you can create a Slack bot
[here](https://18f.slack.com/services/new/bot).

### Authentication

You will need to be on the developer list to authenticate locally via MyUSA.

If you are internal to 18F, contact Brian Hedberg to be added to the developer
list.  If you are on the list, `dolores-local` will be one of your [Authorized
Applications](https://alpha.my.usa.gov/authorizations) on MyUSA.

If `dolores-local` is on your MyUSA list for Authorized Applications and you
are still unable to authenticate, check with Brian to make sure that the `MYUSA_KEY`
and `MYUSA_SECRET` keys listed in `.env` are up to date.
For more on environmental variables and keys, refer to [Required Keys](#required-keys) above.

If you are not part of 18F and would like to run the application locally, you can
follow these steps:

1. Create a [MyUSA Account](https://alpha.my.usa.gov/) and create an application for
development with the following:

  For Url:

  `http://localhost:5000/`

  For Redirect uri:

  `http://localhost:5000/auth/google_oauth2/callback`

2. Generate a set of keys, `MYUSA_KEY` and `MYUSA_SECRET`, and reference them in
`.env`

3. Edit the method `is_gsa` and its inovocation in
   `/app/controllers/auth_controller` to accomodate non-`gsa.gov` email
   addresses locally.

```ruby
  # Invocation
  if is_gsa?(auth_email)

  # Method
  def is_gsa?(auth_email)
    /gsa.gov/.match(auth_email)
  end
```

## Deployment

Dolores is configured to be deployed with Cloud Foundry as an 18f-er.

Refer to [docs.18f.gov](https://docs.18f.gov/getting-started/setup/) for getting
set up with Cloud Foundry.

The Dolores Landingham bot is deployed within the `18f` Cloud Foundry org. To
see if you have access to the `18f` do the following in the root of your repo:

`cf orgs`

If `18f` does not show up as an available org, you can request access by
posting an issue to the [DevOps repo](https://github.com/18F/DevOps/issues/new)
on GitHub.

Once you have access to the org, you can target the Cloud Foundry organization
and space for this project:

`cf target -o 18f -s dolores`

Once your target is set, you can push the application. We have two Cloud Foundry
instances: `dolores-app` and `dolores-staging`. Test your changes by pushing to
`dolores-staging` before pushing to the `dolores-app` instance.

`cf push <app-instance-name>`

New migrations will be run automatically. See the [manifest](manifest.yml) for
more details on the Cloud Foundry setup.

To see existing environment variables:

`cf env <app-instance-name>`

To set or change the value of an environment variable:

`cf set-env <app-instance-name> <env-name> <env-value>`
