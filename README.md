# MailGun
A ColdBox Module for the MailGun API

This module is a fork of [mjclemente](https://github.com/mjclemente)/[mailgun.cfc](https://github.com/mjclemente/mailgun.cfc) converted into a ColdBox Module.

This project borrows heavily from the API framework built by [jcberquist](https://github.com/jcberquist) with [stripecfc](https://github.com/jcberquist/stripecfc).

Your account credentials can be found on the dashboard of your Mailgun account: <https://mailgun.com/app/dashboard>.

![Mailgun API Keys](https://github.com/mjclemente/mailgun.cfc/raw/master/assets/images/api-keys.png)

Currently both your Secret API Key and your Public API Key must be provided. The Secret API Key is used for most operations. In prior versions, email validation calls used the Public API Key. However, now that Mailgun has moved to a usage based pricing model for their email validation, the default for email validation calls is also to use the Secret API Key. The Public API Key requirement will likely be removed in later versions. It's currently included, so that calls can explicitly be made to the public endpoint of the email validation API.

# Installation
```
box install mailgun
```

# Getting Started

## WireBox Injection
```
property name="mailGunService" inject="mailgun";
```

## Configure Settings
ModuleConfig.cfc
```
settings = {
    secretApiKey = 'key-xxx', 
    publicApiKey = 'pubkey-xxx', 
    domain = 'yourdomain.com', 
    baseUrl = 'https://api.mailgun.net/v3' 
    };
```

# Available Methods
***Note that the Mailgun API has more methods available. This is a list of those currently available in this wrapper. I'll be adding more as time permits and needs dictate.***

#### Validation: <https://documentation.mailgun.com/api-email-validation.html>

```
mailGunService.validate( 
    required string address, 
    boolean mailbox_verification = false, 
    boolean private = true 
    )
```

#### Messages: <https://documentation.mailgun.com/api-sending.html>

```
mailGunService.sendMessage( 
    string domain = variables.domain, 
    required string from, 
    required string to, 
    string cc, 
    string bcc, 
    string subject, 
    string text = "", 
    string html = "", 
    any attachment, 
    any inline, 
    struct o = { }, 
    struct h = { }, 
    struct v = { } 
    )

mailGunService.getStoredMessage( required string messageUrl )
```

#### Supressions: <https://documentation.mailgun.com/api-suppressions.html>

```
mailGunService.getBounces( 
    string domain = variables.domain, 
    numeric limit = 100 
    )
```

#### Stats: <https://documentation.mailgun.com/en/latest/api-stats.html>

```
mailGunService.getStats( 
        string domain = variables.domain, 
        required string event, 
        date start = '#now()#-7', 
        date end = '#now()#', 
        string resolution = 'day', 
        string duration
        )
```

#### Mailing Lists: <https://documentation.mailgun.com/api-mailinglists.html>

```
mailGunService.getLists()

mailGunService.getList( 
        required string listaddress, 
        numeric limit = 100, 
        numeric skip = 0 
        )

mailGunService.createList( 
    required string address, 
    string name = "", 
    string description = "", 
    access_level = "readonly" 
    )

mailGunService.createListMember( 
    required string listaddress, 
    required string address, 
    string name, 
    string vars, 
    boolean subscribed = true, 
    boolean upsert = false 
    )

mailGunService.createListMembers( 
    required string listaddress, 
    required json members, 
    boolean upsert = false 
    )
```
