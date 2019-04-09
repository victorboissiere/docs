## Telnet email

```bash
telnet localhost smtp

Trying 127.0.0.1...
Connected to localhost.localdomain (127.0.0.1).
Escape character is '^]'.
220 fbreveal.com ESMTP Sendmail 8.13.8/8.13.8; Tue, 22 Oct 2013 05:05:59 -0400
HELO yahoo.com
250 tecadmin.net Hello tecadmin.net [127.0.0.1], pleased to meet you
mail from: sender@tecadmin.net
250 2.1.0 sender@tecadmin.net... Sender ok
rcpt to: myemail@ymail.com
250 2.1.5 myemail@ymail.com... Recipient ok
data
354 Enter mail, end with "." on a line by itself
Hey
This is test email only

Thanks
.
250 2.0.0 r9M95xgc014513 Message accepted for delivery
quit
221 2.0.0 fbreveal.com closing connection
Connection closed by foreign host.

```
