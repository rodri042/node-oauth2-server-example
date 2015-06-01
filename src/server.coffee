express = require("express")
bodyParser = require("body-parser")
oauthServer = require("oauth2-server")
models = require("./models")

# Express & Body parser
app = express()
app.use bodyParser.urlencoded extended: true
app.use bodyParser.json()

# OAuth server
app.oauth = oauthServer
  model: models.oauth
  grants: ["password", "authorization_code"]
  debug: true
  accessTokenLifetime: 2678400 # number of seconds || null (never expires)

require("./routes") app

app.use app.oauth.errorHandler()

# Listen...
app.listen 3000
console.log "Listening at 3000..."

# This is an example app called Lepocamon, and provides an API that
# other apps can use with the OAuth "authorization_code" grant flow.
# The original Lepocamon users use the "password" grant flow for the login.
